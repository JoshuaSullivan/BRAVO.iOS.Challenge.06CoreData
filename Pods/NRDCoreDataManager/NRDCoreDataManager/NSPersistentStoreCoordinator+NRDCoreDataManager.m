//
//  NSPersistentStoreCoordinator+NRDCoreDataManager.m
//  NRDCoreDataManager
//
//  Copyright (c) 2013 The Nerdery. All rights reserved.
//

static NSString *const kSeedDatabaseVersionKey = @"NRDCoreDataManager_SeedDatabaseVersion";

#import "NSPersistentStoreCoordinator+NRDCoreDataManager.h"
#import "NSError+NRDCoreDataManager.h"

@implementation NSPersistentStoreCoordinator (NRDCoreDataManager)

+ (BOOL)setSeedDataVersion:(NSInteger)seedDatabaseVersion forSQLitePersistentStoreAtURL:(NSURL *)sqlitePersistentStoreURL error:(NSError **)error
{
    // Get the persistent store's current metadata
    NSDictionary *metadata = [NSPersistentStoreCoordinator metadataForPersistentStoreOfType:NSSQLiteStoreType
                                                                                        URL:sqlitePersistentStoreURL
                                                                                      error:error];
    if (!metadata) {
        NSLog(@"Error getting metadata for persistent store at URL: %@ error: %@", sqlitePersistentStoreURL, error ? *error : nil);
        return NO;
    }
    
    // Create a copy of the metadata, so we don't inadvertantly remove any metadata being set by the Core Data framework
    NSMutableDictionary *newMetadata = [metadata mutableCopy];
    
    // Set the seed database version
    newMetadata[kSeedDatabaseVersionKey] = @(seedDatabaseVersion);
    
    // Update the metadata on the persistent store
    if (![NSPersistentStoreCoordinator setMetadata:newMetadata forPersistentStoreOfType:NSSQLiteStoreType URL:sqlitePersistentStoreURL error:error]) {
        NSLog(@"Error setting metadata for persistent store at URL: %@ error: %@", sqlitePersistentStoreURL, error ? *error : nil);
        return NO;
    }
    
    return YES;
}

+ (NSInteger)seedDataVersionForSQLitePersistentStoreAtURL:(NSURL *)sqlitePersistentStoreURL error:(NSError **)error
{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    if (!sqlitePersistentStoreURL || ![fileManager fileExistsAtPath:[sqlitePersistentStoreURL path]]) {
        NSLog(@"No persistent store at URL: %@", sqlitePersistentStoreURL);
        return NSNotFound;
    }
    
    // Get the persistent store's metadata
    NSDictionary *metadata = [NSPersistentStoreCoordinator metadataForPersistentStoreOfType:NSSQLiteStoreType
                                                                                        URL:sqlitePersistentStoreURL
                                                                                      error:error];
    if (!metadata) {
        NSLog(@"Error getting metadata for persistent store at URL: %@ error: %@", sqlitePersistentStoreURL, error ? *error : nil);
        return NSNotFound;
    }
    
    NSNumber *seedDataVersionNumber = metadata[kSeedDatabaseVersionKey];
    if (seedDataVersionNumber) {
        return [seedDataVersionNumber integerValue];
    } else {
        return NSNotFound;
    }
}

@end
