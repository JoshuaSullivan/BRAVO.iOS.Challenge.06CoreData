//
//  NRDDataController.m
//  BRAVO.iOS.Challenge.06CoreData
//
//  Created by Mike Dockerty on 5/8/14.
//  Copyright (c) 2014 The Nerdery. All rights reserved.
//

#import "NRDDataController.h"

@implementation NRDDataController

+ (void)parseInitialDataWithCompletionBlock:(void (^)(BOOL success))completionBlock
{
    completionBlock(YES);
}

+ (void)parseUpdateDataWithCompletionBlock:(void (^)(BOOL success))completionBlock
{
    completionBlock(YES);
}

@end
