// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PBRRecord.m instead.

#import "_PBRRecord.h"

const struct PBRRecordAttributes PBRRecordAttributes = {
	.adminHours = @"adminHours",
	.bravoHours = @"bravoHours",
	.clientHours = @"clientHours",
	.pbrId = @"pbrId",
	.weekStartingDate = @"weekStartingDate",
	.zeroHours = @"zeroHours",
};

const struct PBRRecordRelationships PBRRecordRelationships = {
	.employee = @"employee",
};

const struct PBRRecordFetchedProperties PBRRecordFetchedProperties = {
};

@implementation PBRRecordID
@end

@implementation _PBRRecord

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PBRRecord" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PBRRecord";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PBRRecord" inManagedObjectContext:moc_];
}

- (PBRRecordID*)objectID {
	return (PBRRecordID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic adminHours;






@dynamic bravoHours;






@dynamic clientHours;






@dynamic pbrId;






@dynamic weekStartingDate;






@dynamic zeroHours;






@dynamic employee;

	






@end
