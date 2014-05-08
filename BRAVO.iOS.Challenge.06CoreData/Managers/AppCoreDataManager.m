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

@end
