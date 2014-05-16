// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Employee.h instead.

#import <CoreData/CoreData.h>


extern const struct EmployeeAttributes {
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *hireDate;
	__unsafe_unretained NSString *identifier;
	__unsafe_unretained NSString *lastName;
} EmployeeAttributes;

extern const struct EmployeeRelationships {
	__unsafe_unretained NSString *directReports;
	__unsafe_unretained NSString *manager;
	__unsafe_unretained NSString *mentees;
	__unsafe_unretained NSString *mentor;
	__unsafe_unretained NSString *pbrRecords;
} EmployeeRelationships;

extern const struct EmployeeFetchedProperties {
} EmployeeFetchedProperties;

@class Employee;
@class Employee;
@class Employee;
@class Employee;
@class PBRRecord;






@interface EmployeeID : NSManagedObjectID {}
@end

@interface _Employee : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (EmployeeID*)objectID;





@property (nonatomic, strong) NSString* firstName;



//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* hireDate;



//- (BOOL)validateHireDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* identifier;



//- (BOOL)validateIdentifier:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* lastName;



//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *directReports;

- (NSMutableSet*)directReportsSet;




@property (nonatomic, strong) Employee *manager;

//- (BOOL)validateManager:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Employee *mentees;

//- (BOOL)validateMentees:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Employee *mentor;

//- (BOOL)validateMentor:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) PBRRecord *pbrRecords;

//- (BOOL)validatePbrRecords:(id*)value_ error:(NSError**)error_;





@end

@interface _Employee (CoreDataGeneratedAccessors)

- (void)addDirectReports:(NSSet*)value_;
- (void)removeDirectReports:(NSSet*)value_;
- (void)addDirectReportsObject:(Employee*)value_;
- (void)removeDirectReportsObject:(Employee*)value_;

@end

@interface _Employee (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;




- (NSDate*)primitiveHireDate;
- (void)setPrimitiveHireDate:(NSDate*)value;




- (NSString*)primitiveIdentifier;
- (void)setPrimitiveIdentifier:(NSString*)value;




- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;





- (NSMutableSet*)primitiveDirectReports;
- (void)setPrimitiveDirectReports:(NSMutableSet*)value;



- (Employee*)primitiveManager;
- (void)setPrimitiveManager:(Employee*)value;



- (Employee*)primitiveMentees;
- (void)setPrimitiveMentees:(Employee*)value;



- (Employee*)primitiveMentor;
- (void)setPrimitiveMentor:(Employee*)value;



- (PBRRecord*)primitivePbrRecords;
- (void)setPrimitivePbrRecords:(PBRRecord*)value;


@end
