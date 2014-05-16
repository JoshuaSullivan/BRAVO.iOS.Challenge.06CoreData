// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Employee.m instead.

#import "_Employee.h"

const struct EmployeeAttributes EmployeeAttributes = {
	.firstName = @"firstName",
	.hireDate = @"hireDate",
	.identifier = @"identifier",
	.lastName = @"lastName",
};

const struct EmployeeRelationships EmployeeRelationships = {
	.directReports = @"directReports",
	.manager = @"manager",
	.mentees = @"mentees",
	.mentor = @"mentor",
	.pbrRecords = @"pbrRecords",
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




@dynamic firstName;






@dynamic hireDate;






@dynamic identifier;






@dynamic lastName;






@dynamic directReports;

	
- (NSMutableSet*)directReportsSet {
	[self willAccessValueForKey:@"directReports"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"directReports"];
  
	[self didAccessValueForKey:@"directReports"];
	return result;
}
	

@dynamic manager;

	

@dynamic mentees;

	

@dynamic mentor;

	

@dynamic pbrRecords;

	






@end
