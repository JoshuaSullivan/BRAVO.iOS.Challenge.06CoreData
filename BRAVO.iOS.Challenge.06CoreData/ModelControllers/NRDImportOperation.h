//
//  NRDImportOperation.h
//  BRAVO.iOS.Challenge.06CoreData
//
//  Created by Mike Dockerty on 5/15/14.
//  Copyright (c) 2014 The Nerdery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NRDImportOperation : NSOperation

- (instancetype)initWithStore:(NSPersistentStoreCoordinator *)persistentStoreCoordinator
                         data:(NSDictionary *)data;

@end
