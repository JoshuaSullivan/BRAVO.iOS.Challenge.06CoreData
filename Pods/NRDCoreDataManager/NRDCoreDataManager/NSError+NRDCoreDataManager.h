//
//  NSError+NRDCoreDataManager.h
//  NRDCoreDataManager
//
//  Copyright (c) 2013 The Nerdery. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSError (NRDCoreDataManager)

/**
 *  Returns a string with a string describing this error and any associated detailed errors in its userInfo.
 *  Not user-displayable.
 *
 *  @return A string created by taking the localizedDescription and userInfo of this error and appending 
 *  the localizedDescription and userInfo of any detailed errors (NSDetailedErrorsKey) in the error's 
 *  userInfo. Not user-displayable.
 */
- (NSString *)detailedErrorString;

@end
