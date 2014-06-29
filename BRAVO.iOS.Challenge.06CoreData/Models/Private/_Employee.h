// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Employee.h instead.

#import <CoreData/CoreData.h>


extern const struct EmployeeAttributes {
	__unsafe_unretained NSString *employeeId;
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *hireDate;
	__unsafe_unretained NSString *lastName;
} EmployeeAttributes;

extern const struct EmployeeRelationships {
	__unsafe_unretained NSString *managingEmployee;
	__unsafe_unretained NSString *mentees;
	__unsafe_unretained NSString *mentor;
	__unsafe_unretained NSString *referencingPBRRecords;
	__unsafe_unretained NSString *subordinateEmployees;
} EmployeeRelationships;

extern const struct EmployeeFetchedProperties {
} EmployeeFetchedProperties;

@class Employee;
@class Employee;
@class Employee;
@class PBRRecord;
@class Employee;






@interface EmployeeID : NSManagedObjectID {}
@end

@interface _Employee : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (EmployeeID*)objectID;





@property (nonatomic, strong) NSString* employeeId;



//- (BOOL)validateEmployeeId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* firstName;



//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* hireDate;



//- (BOOL)validateHireDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* lastName;



//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Employee *managingEmployee;

//- (BOOL)validateManagingEmployee:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *mentees;

- (NSMutableSet*)menteesSet;




@property (nonatomic, strong) Employee *mentor;

//- (BOOL)validateMentor:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *referencingPBRRecords;

- (NSMutableSet*)referencingPBRRecordsSet;




@property (nonatomic, strong) NSSet *subordinateEmployees;

- (NSMutableSet*)subordinateEmployeesSet;





@end

@interface _Employee (CoreDataGeneratedAccessors)

- (void)addMentees:(NSSet*)value_;
- (void)removeMentees:(NSSet*)value_;
- (void)addMenteesObject:(Employee*)value_;
- (void)removeMenteesObject:(Employee*)value_;

- (void)addReferencingPBRRecords:(NSSet*)value_;
- (void)removeReferencingPBRRecords:(NSSet*)value_;
- (void)addReferencingPBRRecordsObject:(PBRRecord*)value_;
- (void)removeReferencingPBRRecordsObject:(PBRRecord*)value_;

- (void)addSubordinateEmployees:(NSSet*)value_;
- (void)removeSubordinateEmployees:(NSSet*)value_;
- (void)addSubordinateEmployeesObject:(Employee*)value_;
- (void)removeSubordinateEmployeesObject:(Employee*)value_;

@end

@interface _Employee (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveEmployeeId;
- (void)setPrimitiveEmployeeId:(NSString*)value;




- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;




- (NSDate*)primitiveHireDate;
- (void)setPrimitiveHireDate:(NSDate*)value;




- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;





- (Employee*)primitiveManagingEmployee;
- (void)setPrimitiveManagingEmployee:(Employee*)value;



- (NSMutableSet*)primitiveMentees;
- (void)setPrimitiveMentees:(NSMutableSet*)value;



- (Employee*)primitiveMentor;
- (void)setPrimitiveMentor:(Employee*)value;



- (NSMutableSet*)primitiveReferencingPBRRecords;
- (void)setPrimitiveReferencingPBRRecords:(NSMutableSet*)value;



- (NSMutableSet*)primitiveSubordinateEmployees;
- (void)setPrimitiveSubordinateEmployees:(NSMutableSet*)value;


@end
