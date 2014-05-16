//
//  NRDDataController.m
//  BRAVO.iOS.Challenge.06CoreData
//
//  Created by Mike Dockerty on 5/8/14.
//  Copyright (c) 2014 The Nerdery. All rights reserved.
//

#import "NRDDataController.h"
#import "NRDImportOperation.h"
#import "AppCoreDataManager.h"

@implementation NRDDataController


+ (void)parseInitialDataWithCompletionBlock:(void (^)(BOOL success))completionBlock
{
    NSLog(@"initial");
    
    NSManagedObjectContext *privateContext = [NRDCoreDataManager secondaryPrivateQueueManagedObjectContext];
    //privateContext.undoManager = nil;
    
    NRDImportOperation *importOperation = [[NRDImportOperation alloc] initWithPrivateContext:privateContext
                                                                                    filename:@"initialSampleData.json"];
    
    [importOperation setCompletionBlock:^ {
        completionBlock(YES);
    }];
    
    [[NSOperationQueue mainQueue] addOperation:importOperation];
}

+ (void)parseUpdateDataWithCompletionBlock:(void (^)(BOOL success))completionBlock
{
    
    NSLog(@"update");
    
    completionBlock(YES);
}

@end
