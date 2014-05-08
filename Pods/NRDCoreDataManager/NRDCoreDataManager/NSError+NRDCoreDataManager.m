//
//  NSError+NRDCoreDataManager.m
//  NRDCoreDataManager
//
//  Copyright (c) 2013 The Nerdery. All rights reserved.
//

#import "NSError+NRDCoreDataManager.h"

@implementation NSError (NRDCoreDataManager)

- (NSString *)detailedErrorString
{
    NSMutableString *errorString = [NSMutableString stringWithFormat:@"%@ -- userInfo:%@", [self localizedDescription], [self userInfo]];
    
    NSArray *detailedErrors = [[self userInfo] objectForKey:NSDetailedErrorsKey];
    for (NSError *detailedError in detailedErrors) {
        [errorString appendFormat:@"\n\n Detailed error: %@ -- userInfo: %@", [detailedError localizedDescription], [detailedError userInfo]];
    }
    
    return errorString;
}

@end
