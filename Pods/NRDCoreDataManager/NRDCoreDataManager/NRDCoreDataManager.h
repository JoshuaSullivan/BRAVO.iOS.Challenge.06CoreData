//
//  NRDCoreDataManager.h
//  NRDCoreDataManager
//
//  Copyright (c) 2013 The Nerdery. All rights reserved.
//

#import <CoreData/CoreData.h>

/**
 *  Assists with setting up and managing a Core Data stack, as well as optionally seeding from a database on disk.
 */
@interface NRDCoreDataManager : NSObject

#pragma mark - Accessing the singleton and the main managed object context

/**
 *  Returns the singleton instance. No set up is performed until the managedObjectContext property is accessed.
 *
 *  @return The singleton instance
 */
+ (instancetype)sharedManager;

/**
 *  Returns the managedObjectContext property on the sharedManager.
 *  Note, this is simply a convenience: it is the same as calling [[NRDCoreDataManager sharedManager] managedObjectContext]. Created using NSMainQueueConcurrencyType,
 *  so only for use on the main thread (or using one of the performBlock: methods on the context, so execute the block on the main thread).
 *
 *  @return The configured "main" NSManangedObjectContext
 */
+ (NSManagedObjectContext *)managedObjectContext;

/**
 *  Returns the configured "main" NSManangedObjectContext, using NSConfinementConcurrencyType. ONLY for use on the main thread.
 *  
 *  Note: The Core Data stack is set up the first time this property is accessed. If database seeding is enabled, the persistent store is replaced if needed (as indicated
 *  by +[self isDatabaseSeedNeeded]).
 *  
 *  @see seedDatabaseURL
 *  @see isDatabaseSeedNeeded
 *
 *  @return The configured NSManangedObjectContext
 */
@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;


#pragma mark - Getting alternate NSManagedObjectContexts

/**
 *	Creates and returns a new NSManagedObjectContext using NSConfinementConcurrencyType. If "parentManagedObjectContext" is nil, then the same persistent
 *  store coordinator as the main "managedObjectContext" is used, else the "parentContext" property is set to "parentManagedObjectContext". The result
 *  should be cached until it is no longer needed, as each call to this method returns a new context. The "sharedManager" listens for
 *  "NSManagedObjectContextDidSaveNotification" notifications and merges the changes from the returned context into the main context, if there is no parent context given.
 *
 *	@param	parentManagedObjectContext	The parentContext for the new managed object context, if there is one. If "parentManagedObjectContext" is nil, then the same persistent store coordinator as the main "managedObjectContext" is used, else the "parentContext" property is set to "parentManagedObjectContext".
 *
 *	@return	A new NSManagedObjectContext using NSConfinementConcurrencyType and the same persistent store coordinator as the main "managedObjectContext".
 */
+ (NSManagedObjectContext *)secondaryManagedObjectContextWithParentManagedObjectContext:(NSManagedObjectContext *)parentManagedObjectContext;

/**
 *  Creates and returns a new NSManagedObjectContext using NSPrivateQueueConcurrencyType and the same persistent store coordinator as the main "managedObjectContext". 
 *  Because it uses the "NSPrivateQueueConcurrencyType", it is suitable for use as a parent context for contexts retrieved via the 
 *  -[self secondaryManagedObjectContextWithParentManagedObjectContext:] method (as a parent context cannot use NSConfinementConcurrencyType). Remember to use save, 
 *  etc. using the performBlock: or performBlockAndWait methods so the calls run on the appropriate private queue. The result should be cached until it is no longer 
 *  needed, as each call to this method returns a new context. The "sharedManager" listens for "NSManagedObjectContextDidSaveNotification" notifications and merges 
 *  the changes from them. So saving in this context will automatically update the main "managedObjectContext".
 *  
 *  @return A new NSManagedObjectContext using NSConfinementConcurrencyType and the same persistent store coordinator as the main "managedObjectContext".
 */
+ (NSManagedObjectContext *)secondaryPrivateQueueManagedObjectContext;


/**
 *  Returns the file URL of the persistent store, created by concatenating the "persistentStoreName" and "persistentStoreBaseURL". Subclasses should not override this
 *  method, but should instead override "persistentStoreName" and "persistentStoreBaseURL".
 *
 *  @return The file URL of the persistent store.
 */
+ (NSURL *)persistentStoreURL;


#pragma mark - Core Data stack customization

/**
 *  Returns a file name for the persistent store (e.g. "mystore.sqlite"). Used with +[NRDCoreDataManager persistentStoreBaseURL].
 *
 *  Subclasses must override this and should not call super.
 *
 *  @return The file name for the persistent store
 */
+ (NSString *)persistentStoreName;

/**
 *  Returns a base file URL for the persistent store (e.g. appDocumentsDirectory/myCoreDataStores/). The directory must be writable, 
 *  though need not yet exist. It should not be a standard directory provided by the system (e.g. Documents).
 *
 *  Subclasses must override this and should not call super.
 *
 *  @return The base file URL for the persistent store
 */
+ (NSURL *)persistentStoreBaseURL;

/**
 *  Returns the file URL for the managed object model.
 *
 *  Subclasses must override this and should not call super.
 *
 *  @return The file URL for the managed object model
 */
+ (NSURL *)managedObjectModelURL;

/**
 *  Indicates if the Core Data Perisisent Store should be excluded from backup (by iTunes/iCloud). If YES, the file attribute
 *  "NSURLIsExcludedFromBackupKey" is added to the "persistentStoreBaseURL" directory to prevent backup by iTunes or backup to iCloud.
 *  Defaults to YES. NOTE: changing this value does not change the value on an existing directory.
 *
 *  @return YES if the Core Data Perisisent Store should be excluded from backup (by iTunes/iCloud), else NO.
 */
+ (BOOL)isPersistentStoreExcludedFromBackup;

/**
 *  Returns the persistent store options used when the NSPersistent store is added to the NSPersistentStoreCoordinator. Defaults to
 *  "NSMigratePersistentStoresAutomaticallyOption" set to YES and "NSInferMappingModelAutomaticallyOption" set to NO.
 *
 *  Subclasses may wish to override (for instance while seeding to add the (currently required) setting of 
 *  "NSSQLitePragmasOption : @{ @"journal_mode" : @"DELETE" }" -- see the example seed application, specifically DBSeederCoreDataManager.m, 
 *  for more info).
 *
 *  @return The persistent store options used when the NSPersistent store is added to the NSPersistentStoreCoordinator
 */
+ (NSDictionary *)persistentStoreOptions;


#pragma mark - Database Seeding

/**
 *  Returns the file URL for the seed database, if there is one, else nil. Default returns nil.
 *
 *  Subclasses may choose to override this to provide a non-nil value. If this is non-nil, database seeding is enabled and the persistent 
 *  store is replaced if needed (as indicated by +[self isDatabaseSeedNeeded]).
 *
 *  @return Returns the file URL for the seed database, if there is one, else nil.
 */
+ (NSURL *)seedDatabaseURL;

/**
 *  Checks if database seeding is enabled ("seedDatabaseURL" is non-nil), a seed database exists at that location on disk, and the 
 *  current persistent store should be replaced with the seed database at +[self seedDatabaseURL], based on the database version 
 *  set via methods in NSPersistentStore+NRDCoreDataManager.
 *
 *  @return YES if database seeding is enabled, a seed database exists, and the current persistent store should be replaced with
 *  the seed database at +[self seedDatabaseURL];
 */
+ (BOOL)isDatabaseSeedNeeded;

@end
