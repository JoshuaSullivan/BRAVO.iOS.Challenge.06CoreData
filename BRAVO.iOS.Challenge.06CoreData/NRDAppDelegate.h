//
//  NRDAppDelegate.h
//  BRAVO.iOS.Challenge.06CoreData
//
//  Created by Mike Dockerty on 5/7/14.
//  Copyright (c) 2014 Nerdery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NRDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
