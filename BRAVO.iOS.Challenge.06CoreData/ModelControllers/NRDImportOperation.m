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
#import "NRDImportConstants.h"

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
    
    NSMutableDictionary *employeesDict = [NSMutableDictionary dictionaryWithCapacity:[employees count]];
    
    for (NSDictionary *employeeJSON in employees) {
        Employee *employee = [Employee importJSONData:employeeJSON
                                          intoContext:self.privateContext];
        
        employeesDict[employee.identifier] = employee;
    }
    
    for (Employee *employee in [employeesDict allValues]) {
        [employee createRelationshipsUsingEmployeeDict:employeesDict];
    }
    
    NSArray *records = jsonData[@"PBRRecords"];
    for (NSDictionary *recordJSON in records) {
        PBRRecord *record = [PBRRecord importJSONData:recordJSON
                                          intoContext:self.privateContext];
        
        record.employee = employeesDict[recordJSON[kNRDPBREmployeeId]];
    }
    
    NSError *error;

    if (![self.privateContext save:&error]) {
        NSLog(@"%@", error.localizedDescription);
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
