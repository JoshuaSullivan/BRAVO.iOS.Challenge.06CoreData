//
//  AppCoreDataManager.m
//  BRAVO.iOS.Challenge.06CoreData
//
//  Created by Mike Dockerty on 5/8/14.
//  Copyright (c) 2014 The Nerdery. All rights reserved.
//

#import "AppCoreDataManager.h"

@implementation AppCoreDataManager

#pragma mark - Core Data stack customization

+ (NSURL *)managedObjectModelURL
{
    return [[NSBundle mainBundle] URLForResource:@"BRAVO_iOS_Challenge_06CoreData" withExtension:@"momd"];
}

+ (NSString *)persistentStoreName
{
    return @"BRAVO_iOS_Challenge_06CoreData.sqlite";
}

+ (NSURL *)persistentStoreBaseURL
{
    NSURL *applicationSupportDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
    return [applicationSupportDirectory URLByAppendingPathComponent:@"BRAVO_iOS_Challenge_06CoreData" isDirectory:YES];
}

+ (void)clearDatabase
{
    NSError * error;
    // retrieve the store URL
    NSURL * storeURL = [[self.managedObjectContext persistentStoreCoordinator] URLForPersistentStore:[[[self.managedObjectContext persistentStoreCoordinator] persistentStores] lastObject]];
    // lock the current context
    [self.managedObjectContext lock];
    [self.managedObjectContext reset];//to drop pending changes
    //delete the store from the current managedObjectContext
    if ([[self.managedObjectContext persistentStoreCoordinator] removePersistentStore:[[[self.managedObjectContext persistentStoreCoordinator] persistentStores] lastObject] error:&error])
    {
        // remove the file containing the data
        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:&error];
        //recreate the store like in the  appDelegate method
        [[self.managedObjectContext persistentStoreCoordinator] addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];//recreates the persistent store
    }
    [self.managedObjectContext unlock];
}

@end
