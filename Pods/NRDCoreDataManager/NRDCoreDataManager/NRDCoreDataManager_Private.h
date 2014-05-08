//
//  NRDCoreDataManager_Private.h
//  NRDCoreDataManager
//
//  Copyright (c) 2013 The Nerdery. All rights reserved.
//

#import "NRDCoreDataManager.h"

@interface NRDCoreDataManager ()

/**
 *	Resets all state maintained by the NRDCoreDataManager (i.e. tearing down the Core Data stack).
 *
 *  NOTE: Due to potential threading issues, this should only be used for unit testing, not in an actual application.
 */
- (void)resetSharedManager;

@end
