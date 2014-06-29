// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Employee.m instead.

#import "_Employee.h"

const struct EmployeeAttributes EmployeeAttributes = {
	.employeeId = @"employeeId",
	.firstName = @"firstName",
	.hireDate = @"hireDate",
	.lastName = @"lastName",
};

const struct EmployeeRelationships EmployeeRelationships = {
	.managingEmployee = @"managingEmployee",
	.mentees = @"mentees",
	.mentor = @"mentor",
	.referencingPBRRecords = @"referencingPBRRecords",
	.subordinateEmployees = @"subordinateEmployees",
};

const struct EmployeeFetchedProperties EmployeeFetchedProperties = {
};

@implementation EmployeeID
@end

@implementation _Employee

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Employee";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Employee" inManagedObjectContext:moc_];
}

- (EmployeeID*)objectID {
	return (EmployeeID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic employeeId;






@dynamic firstName;






@dynamic hireDate;






@dynamic lastName;






@dynamic managingEmployee;

	

@dynamic mentees;

	
- (NSMutableSet*)menteesSet {
	[self willAccessValueForKey:@"mentees"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"mentees"];
  
	[self didAccessValueForKey:@"mentees"];
	return result;
}
	

@dynamic mentor;

	

@dynamic referencingPBRRecords;

	
- (NSMutableSet*)referencingPBRRecordsSet {
	[self willAccessValueForKey:@"referencingPBRRecords"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"referencingPBRRecords"];
  
	[self didAccessValueForKey:@"referencingPBRRecords"];
	return result;
}
	

@dynamic subordinateEmployees;

	
- (NSMutableSet*)subordinateEmployeesSet {
	[self willAccessValueForKey:@"subordinateEmployees"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"subordinateEmployees"];
  
	[self didAccessValueForKey:@"subordinateEmployees"];
	return result;
}
	






@end
