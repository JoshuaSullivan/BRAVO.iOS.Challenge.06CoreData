//
//  NRDCoreDataManager.m
//  NRDCoreDataManager
//
//  Copyright (c) 2013 The Nerdery. All rights reserved.
//

#import "NRDCoreDataManager.h"
#import "NRDCoreDataManager_Private.h"
#import "NSError+NRDCoreDataManager.h"
#import "NSPersistentStoreCoordinator+NRDCoreDataManager.h"

static NRDCoreDataManager *_sharedCoreDataManager = nil;

@interface NRDCoreDataManager ()

@property (nonatomic, strong, readwrite) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

/**
 *  The main context retrieved via -[self managedObjectContext] uses this method to listen to save notifications posted
 *  by any NSManagedObjectContextS. If the context that posted the notification has the same backing persistent store 
 *  as the main context, the changes from the notification are merged in, else they are ignored.
 *
 *	@param	notification	The NSManagedObjectContextDidSaveNotification notification.
 */
- (void)handleManagedObjectContextDidSaveNotification:(NSNotification *)notification;

@end

@implementation NRDCoreDataManager

#pragma mark - Singleton setup

+ (instancetype)sharedManager
{
	// Use GCD to make sure this only gets executed once.
	static dispatch_once_t oneTime;
	dispatch_once(&oneTime, ^{
		_sharedCoreDataManager = [[self alloc] init];
	});
	
    return _sharedCoreDataManager;
}

#pragma mark - Getting the main NSManagedObjectContext

+ (NSManagedObjectContext *)managedObjectContext
{
	return [[self sharedManager] managedObjectContext];
}

- (NSManagedObjectContext *)managedObjectContext
{
    @synchronized(self) {
        if (!_managedObjectContext) {
            _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
            _managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
            
            // Give priority while merging to changes from background parse operations vs the main (UI thread's) context
            _managedObjectContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy;
            
            [[NSNotificationCenter defaultCenter] addObserver:self
                                                     selector:@selector(handleManagedObjectContextDidSaveNotification:)
                                                         name:NSManagedObjectContextDidSaveNotification
                                                       object:nil];
        }
	}
    
    return _managedObjectContext;
}

#pragma mark - Core Data stack customization

+ (NSManagedObjectModel *)managedObjectModel
{
    NSURL *momURL = [self managedObjectModelURL];
    NSAssert(momURL, @"The value returned by +[NRDCoreDataManager managedObjectModelURL] was nil");
    
    return [[NSManagedObjectModel alloc] initWithContentsOfURL:momURL];
}

+ (NSURL *)managedObjectModelURL
{
    NSAssert(NO, @"Subclasses must override %s", __PRETTY_FUNCTION__);
    return nil;
    
    // Typically subclasses should do something like this:
    // return [[NSBundle mainBundle] URLForResource:@"MyCoreDataModelFileName" withExtension:@"momd"];
}

+ (NSString *)persistentStoreName
{
    NSAssert(NO, @"Subclasses must override %s", __PRETTY_FUNCTION__);
    return nil;
    
    // Typically subclasses should do something like this:
    // return @"project-name.sqlite";
}

+ (NSURL *)persistentStoreBaseURL
{
    NSAssert(NO, @"Subclasses must override %s", __PRETTY_FUNCTION__);
    return nil;
    
    // Typically subclasses should do something like this:
    // NSURL *applicationSupportDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
    // return [applicationSupportDirectory URLByAppendingPathComponent:@"MyProjectCoreDataStores" isDirectory:YES];
}

+ (NSURL *)persistentStoreURL
{
    return [[self persistentStoreBaseURL] URLByAppendingPathComponent:[self persistentStoreName]];
}

+ (BOOL)isPersistentStoreExcludedFromBackup
{
    return YES;
}

+ (NSDictionary *)persistentStoreOptions
{
    return @{ NSMigratePersistentStoresAutomaticallyOption : @YES,
              NSInferMappingModelAutomaticallyOption : @NO };
}

#pragma mark - Setting up the Core Data stack

+ (NSManagedObjectContext *)secondaryManagedObjectContextWithParentManagedObjectContext:(NSManagedObjectContext *)parentManagedObjectContext
{
    return [self secondaryManagedObjectContextWithConcurrencyType:NSConfinementConcurrencyType parentManagedObjectContext:parentManagedObjectContext];
}

+ (NSManagedObjectContext *)secondaryPrivateQueueManagedObjectContext
{
    return [self secondaryManagedObjectContextWithConcurrencyType:NSPrivateQueueConcurrencyType parentManagedObjectContext:nil];
}

+ (NSManagedObjectContext *)secondaryManagedObjectContextWithConcurrencyType:(NSManagedObjectContextConcurrencyType)concurrencyType
                                                  parentManagedObjectContext:(NSManagedObjectContext *)parentManagedObjectContext
{
    @synchronized(self) {
        NSManagedObjectContext *secondaryManagedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:concurrencyType];
        
        // Add the parent or persistent store
        if (parentManagedObjectContext) {
            secondaryManagedObjectContext.parentContext = parentManagedObjectContext;
        } else {
            secondaryManagedObjectContext.persistentStoreCoordinator = [[self sharedManager] persistentStoreCoordinator];
        }
        
        // To merge conflicts between the persistent store’s version of the object and the current in-memory version,
        // priority is given to in-memory changes.
        secondaryManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy;
        
        return secondaryManagedObjectContext;
    }
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (!_persistentStoreCoordinator) {
        NSFileManager *fileManager = [[NSFileManager alloc] init];
        NSURL *persistentStoreURL = [[self class] persistentStoreURL];

        // If there is currently no database, create the directory first
        if (![fileManager fileExistsAtPath:[persistentStoreURL path]]) {
            NSError *directoryCreationError;
            NSURL *persistentStoreBaseURL = [[self class] persistentStoreBaseURL];
            if (![fileManager createDirectoryAtURL:persistentStoreBaseURL
                       withIntermediateDirectories:YES
                                        attributes:nil
                                             error:&directoryCreationError]) {
                NSAssert(NO, @"Error creating directory %@ -- error %@", persistentStoreBaseURL, directoryCreationError);
                NSLog(@"Error creating directory %@ -- error %@", persistentStoreBaseURL, directoryCreationError);
            }
            
            // Add metadata to the directory to exclude it from backup, if desired
            directoryCreationError = nil;
            if ([[self class] isPersistentStoreExcludedFromBackup] &&
                ![persistentStoreBaseURL setResourceValue:@YES forKey:NSURLIsExcludedFromBackupKey error:&directoryCreationError]) {
                
                NSAssert(NO, @"Error excluding %@ from backup %@", persistentStoreBaseURL, directoryCreationError);
                NSLog(@"Error excluding %@ from backup %@", persistentStoreBaseURL, directoryCreationError);
            }
        }
        
        // Seed the database file if we need to
        [[self class] seedDataFileIfNeeded];
        
        // Create the persistent store coordinator
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[[self class] managedObjectModel]];
        
        // Add the persistent store
        NSError *persistentStoreAddError = nil;
        if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                       configuration:nil
                                                                 URL:persistentStoreURL
                                                             options:[[self class] persistentStoreOptions]
                                                               error:&persistentStoreAddError]) {
            
            // !!! Crash here? Did you update the Core Data schema but forget to update the seed data?
            NSLog(@"Unexpected error while adding persistentStoreCoordinator: %@", [persistentStoreAddError detailedErrorString]);
            NSAssert(NO, @"Unexpected error while adding persistentStoreCoordinator: %@", [persistentStoreAddError detailedErrorString]);
        }
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Database seeding

+ (NSURL *)seedDatabaseURL
{
    return nil;
    
    // Typically, if seeding is desired & there is a seed file in the bundle, subclasses would do
    // something like this:
    // return [[NSBundle mainBundle] URLForResource:@"mySeedDatabase" withExtension:@".sqlite"];
}

+ (BOOL)isDatabaseSeedNeeded
{
    NSURL *seedDatabaseURL = [self seedDatabaseURL];
    
    // Seeding is disabled if there is no seed database URL
    if (!seedDatabaseURL) {
        return NO;
    }
 
    BOOL isDatabaseSeedNeeded = NO;
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSURL *currentPersistentStoreURL = [self persistentStoreURL];
    
    // Check that the seed database exists at the expected URL
    if (![fileManager fileExistsAtPath:[seedDatabaseURL path]]) {
        NSAssert(NO, @"Seed database not at URL as expected: %@", seedDatabaseURL);
        NSLog(@"%s: Seed database not at URL as expected: %@", __PRETTY_FUNCTION__, seedDatabaseURL);
        return NO;
    }
    
    // If there is currently no database, then yes, we want to seed
    if (![fileManager fileExistsAtPath:[currentPersistentStoreURL path]]) {
        isDatabaseSeedNeeded = YES;
        
    } else {
        
        // Else, we currently have a database, so check the metadata to see if it needs to be replaced
        
        // Get the current persistent store's version
        NSError *error;
        NSInteger currentPersistentStoreVersion = [NSPersistentStoreCoordinator seedDataVersionForSQLitePersistentStoreAtURL:currentPersistentStoreURL error:&error];
        if (currentPersistentStoreVersion == NSNotFound) {
            if (error) {
                NSAssert(NO, @"Error getting current persistent store's version at URL: %@ error: %@", currentPersistentStoreURL, error);
                NSLog(@"%s: Error getting current persistent store's version at URL: %@ error: %@", __PRETTY_FUNCTION__, currentPersistentStoreURL, error);
            } else {
                NSLog(@"%s: No database version found (so treating as if the database needs to be replaced by the current seed data) \
                      for current persistent store at URL: %@", __PRETTY_FUNCTION__, currentPersistentStoreURL);
                isDatabaseSeedNeeded = YES;
            }
        } else {
            // Get the current seed database version
            NSInteger seedDatabaseVersion = [NSPersistentStoreCoordinator seedDataVersionForSQLitePersistentStoreAtURL:seedDatabaseURL error:&error];
            if (seedDatabaseVersion == NSNotFound) {
                isDatabaseSeedNeeded = NO;
                if (error) {
                    NSAssert(NO, @"Error getting seed database's version at URL: %@ error: %@", seedDatabaseURL, error);
                    NSLog(@"%s: Error getting seed database's version at URL: %@ error: %@", __PRETTY_FUNCTION__, seedDatabaseURL, error);
                } else {
                    NSAssert(NO, @"No seed database version found. Seed database must have version number set with NSPersistentStoreCoordinator+NRDCoreDataManager methods.");
                    NSLog(@"%s: No seed database version found. Seed database must have version number set with NSPersistentStoreCoordinator+NRDCoreDataManager methods.", __PRETTY_FUNCTION__);
                }
            } else {
                // We got both a currentPersistentStoreVersion and a seedDatabaseVersion, so compare them... do we need to seed (replace current database)?
                isDatabaseSeedNeeded = (currentPersistentStoreVersion < seedDatabaseVersion);
            }
        }
    }
    
    return isDatabaseSeedNeeded;
}

+ (void)seedDataFileIfNeeded
{
    if (![self isDatabaseSeedNeeded]) {
        return;
    }
    
    // Do the seeding...
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSURL *persistentStoreURL = [self persistentStoreURL];
    
    // Remove the old file (if there is one -- ignore the error in case there isn't), and then copy the new version over
    [fileManager removeItemAtURL:persistentStoreURL error:NULL];
    
    // Remove any write-ahead-log files: .sqlite-shm or .sqlite-wal
    NSURL *basePersistentStoreURL = [persistentStoreURL URLByDeletingPathExtension];
    [fileManager removeItemAtURL:[basePersistentStoreURL URLByAppendingPathExtension:@"sqlite-shm"] error:NULL];
    [fileManager removeItemAtURL:[basePersistentStoreURL URLByAppendingPathExtension:@"sqlite-wal"] error:NULL];
    
    // Copy the new copy of the database over
    NSError *seedError;
    NSURL *seedDatabaseURL = [self seedDatabaseURL];
    if (![fileManager copyItemAtURL:seedDatabaseURL toURL:persistentStoreURL error:&seedError]) {
        // Copying of the database file failed -- remove the copied file
        [fileManager removeItemAtURL:persistentStoreURL error:NULL];
        
        NSLog(NO, @"Failed to seed database! Error: %@", seedError);
        NSAssert(NO, @"Failed to seed database! Error: %@", seedError);
    }
}

#pragma mark - Handling save notifications

- (void)handleManagedObjectContextDidSaveNotification:(NSNotification *)notification
{
    NSManagedObjectContext *savedContext = [notification object];
    
    // Ignore change notifications for the main context
    if (self.managedObjectContext == savedContext) {
        return;
    }
    
    // Ignore change notifications for contexts with different backing stores
    if (self.managedObjectContext.persistentStoreCoordinator != savedContext.persistentStoreCoordinator) {
        return;
    }
    
    // Ignore change notifications for child contexts
    if (savedContext.parentContext) {
        return;
    }
    
    __weak __typeof(&*self) weakSelf = self;
    void(^mergeChangesBlock)(void) = ^{
        [weakSelf.managedObjectContext mergeChangesFromContextDidSaveNotification:notification];
    };
    
    if ([NSThread isMainThread]) {
        mergeChangesBlock();
    } else {
        dispatch_sync(dispatch_get_main_queue(), ^{
            mergeChangesBlock();
        });
    }
}

#pragma mark - Resetting the shared manager

- (void)resetSharedManager
{
    // ONLY USE THIS FOR UNIT TESTS
    
    @synchronized(self) {
        // Stop observing save notifications
        [[NSNotificationCenter defaultCenter] removeObserver:self name:NSManagedObjectContextDidSaveNotification object:nil];
        
        // Release the Core Data stack
        self.managedObjectContext = nil;
        self.persistentStoreCoordinator = nil;
    }
}

@end
