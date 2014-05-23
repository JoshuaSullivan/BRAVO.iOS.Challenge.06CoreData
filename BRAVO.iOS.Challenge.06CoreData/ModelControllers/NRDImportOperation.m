//
//  NRDImportOperation.m
//  BRAVO.iOS.Challenge.06CoreData
//
//  Created by Mike Dockerty on 5/15/14.
//  Copyright (c) 2014 The Nerdery. All rights reserved.
//

#import "NRDImportOperation.h"
#import "Employee.h"
#import "PBRRecord.h"
#import "AppCoreDataManager.h"

@interface NRDImportOperation()

@property (strong,nonatomic) NSManagedObjectContext *privateContext;
@property (strong,nonatomic) NSString *filename;

@end

@implementation NRDImportOperation

- (instancetype)initWithPrivateContext:(NSManagedObjectContext *)privateContext
                              filename:(NSString *)filename
{
    self = [super init];
    if (self != nil) {
        self.privateContext = privateContext;
        self.filename = filename;
    }
    
    return self;
}

- (void)main
{
    [self.privateContext performBlockAndWait:^ {
        [self import];
    }];
}

- (void)import
{
    NSLog(@"importing data");
    NSDictionary *jsonData = [self dictionaryWithContentsOfJSONString:self.filename];

    NSArray *employees = jsonData[@"Employees"];
    
    for (NSDictionary *employee in employees) {
        [Employee importJSONData:employee
                     intoContext:self.privateContext];
    }
    
    NSArray *records = jsonData[@"PBRRecords"];
    for (NSDictionary *record in records) {
        [PBRRecord importJSONData:record
                      intoContext:self.privateContext];
    }
}

#pragma mark - JSON Utility

- (NSDictionary *)dictionaryWithContentsOfJSONString:(NSString*)fileLocation
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
    
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    
    if (error != nil) return nil;
    return result;
}

@end
