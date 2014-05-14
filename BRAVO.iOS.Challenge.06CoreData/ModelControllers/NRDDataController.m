//
//  NRDDataController.m
//  BRAVO.iOS.Challenge.06CoreData
//
//  Created by Mike Dockerty on 5/8/14.
//  Copyright (c) 2014 The Nerdery. All rights reserved.
//

#import "NRDDataController.h"

@implementation NRDDataController

+ (NSDictionary *)dictionaryWithContentsOfJSONString:(NSString*)fileLocation
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    
    if (error != nil) return nil;
    return result;
}

+ (void)parseInitialDataWithCompletionBlock:(void (^)(BOOL success))completionBlock
{
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        NSDictionary *jsonData = [NRDDataController dictionaryWithContentsOfJSONString:@"initialSampleData.json"];
        
        NSLog(@"initial");
        
        completionBlock(YES);
    });
    
}

+ (void)parseUpdateDataWithCompletionBlock:(void (^)(BOOL success))completionBlock
{
    
    NSLog(@"update");
    
    completionBlock(YES);
}

@end
