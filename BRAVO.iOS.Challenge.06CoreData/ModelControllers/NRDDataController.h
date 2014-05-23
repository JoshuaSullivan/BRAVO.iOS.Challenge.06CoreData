//
//  NRDDataController.h
//  BRAVO.iOS.Challenge.06CoreData
//
//  Created by Mike Dockerty on 5/8/14.
//  Copyright (c) 2014 The Nerdery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NRDDataController : NSObject

+ (void)parseInitialDataWithCompletionBlock:(void (^)(BOOL success))completionBlock;

+ (void)parseUpdateDataWithCompletionBlock:(void (^)(BOOL success))completionBlock;

@end
