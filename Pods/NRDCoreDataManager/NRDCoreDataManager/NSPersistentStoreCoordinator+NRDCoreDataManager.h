//
//  NSPersistentStoreCoordinator+NRDCoreDataManager.h
//  NRDCoreDataManager
//
//  Copyright (c) 2013 The Nerdery. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSPersistentStoreCoordinator (NRDCoreDataManager)

/**
 *  Sets the seed database version for a SQLite-based persistent store at the given file URL.
 *
 *  @param seedDatabaseVersion      The version to set.
 *  @param sqlitePersistentStoreURL The file URL for the SQLite-based persistent store.
 *  @param error                    On input, a pointer to an error object. If an error occurs, this pointer is set to an actual error object containing the error 
 *                                  information. You may specify NULL for this parameter if you do not want the error information.
 *
 *  @return YES if the setting of the seed data version was successful, else NO.
 */
+ (BOOL)setSeedDataVersion:(NSInteger)seedDatabaseVersion forSQLitePersistentStoreAtURL:(NSURL *)sqlitePersistentStoreURL error:(NSError **)error;

/**
 *  Gets the seed database version for a SQLite-based persistent store at the given file URL, that was originally set 
 *  via +[self setSeedDataVersion:forSQLitePersistentStoreAtURL:error:].
 *
 *  @param sqlitePersistentStoreURL The file URL for the SQLite-based persistent store.
 *  @param error                    On input, a pointer to an error object. If an error occurs, this pointer is set to an actual error object containing the error
 *                                  information. You may specify NULL for this parameter if you do not want the error information.
 *
 *  @return The seed database version, or NSNotFound if there was an error getting the persistent store's metadata or there was no version number in the metadata.
 */
+ (NSInteger)seedDataVersionForSQLitePersistentStoreAtURL:(NSURL *)sqlitePersistentStoreURL error:(NSError **)error;

@end
