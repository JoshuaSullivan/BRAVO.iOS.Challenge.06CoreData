//
//  NRDImportOperation.m
//  BRAVO.iOS.Challenge.06CoreData
//
//  Created by Mike Dockerty on 5/15/14.
//  Copyright (c) 2014 The Nerdery. All rights reserved.
//

#import "NRDImportOperation.h"

@interface NRDImportOperation()

@property (strong,nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong,nonatomic) NSDictionary *data;

@end

@implementation NRDImportOperation

- (instancetype)initWithStore:(NSPersistentStoreCoordinator *)persistentStoreCoordinator
                         data:(NSDictionary *)data
{
    self = [super init];
    if (self != nil) {
        self.persistentStoreCoordinator = persistentStoreCoordinator;
        self.data = data;
    }
    
    return self;
}

- (void)main
{
    NSManagedObjectContext* context = [[NSManagedObjectContext alloc]
                                       initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    
    context.persistentStoreCoordinator = self.persistentStoreCoordinator;
    context.undoManager = nil;
    [context performBlockAndWait:^
    {
        [self import];
    }];
}

- (void)import
{
    NSLog(@"importing data");
    
    NSArray *employees = self.data[@"employees"];
    
    for (NSDictionary *employee in employees) {
        NSLog(@"%@", employee[@"firstName"]);
    }
}

@end
