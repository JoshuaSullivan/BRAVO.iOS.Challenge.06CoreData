// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PBRRecord.m instead.

#import "_PBRRecord.h"

const struct PBRRecordAttributes PBRRecordAttributes = {
	.admin = @"admin",
	.bravo = @"bravo",
	.client = @"client",
	.identifier = @"identifier",
	.pbrDate = @"pbrDate",
	.zero = @"zero",
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
	
	if ([key isEqualToString:@"adminValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"admin"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"bravoValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"bravo"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"clientValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"client"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"zeroValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"zero"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic admin;



- (int16_t)adminValue {
	NSNumber *result = [self admin];
	return [result shortValue];
}

- (void)setAdminValue:(int16_t)value_ {
	[self setAdmin:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveAdminValue {
	NSNumber *result = [self primitiveAdmin];
	return [result shortValue];
}

- (void)setPrimitiveAdminValue:(int16_t)value_ {
	[self setPrimitiveAdmin:[NSNumber numberWithShort:value_]];
}





@dynamic bravo;



- (int16_t)bravoValue {
	NSNumber *result = [self bravo];
	return [result shortValue];
}

- (void)setBravoValue:(int16_t)value_ {
	[self setBravo:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveBravoValue {
	NSNumber *result = [self primitiveBravo];
	return [result shortValue];
}

- (void)setPrimitiveBravoValue:(int16_t)value_ {
	[self setPrimitiveBravo:[NSNumber numberWithShort:value_]];
}





@dynamic client;



- (int16_t)clientValue {
	NSNumber *result = [self client];
	return [result shortValue];
}

- (void)setClientValue:(int16_t)value_ {
	[self setClient:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveClientValue {
	NSNumber *result = [self primitiveClient];
	return [result shortValue];
}

- (void)setPrimitiveClientValue:(int16_t)value_ {
	[self setPrimitiveClient:[NSNumber numberWithShort:value_]];
}





@dynamic identifier;






@dynamic pbrDate;






@dynamic zero;



- (int16_t)zeroValue {
	NSNumber *result = [self zero];
	return [result shortValue];
}

- (void)setZeroValue:(int16_t)value_ {
	[self setZero:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveZeroValue {
	NSNumber *result = [self primitiveZero];
	return [result shortValue];
}

- (void)setPrimitiveZeroValue:(int16_t)value_ {
	[self setPrimitiveZero:[NSNumber numberWithShort:value_]];
}





@dynamic employee;

	






@end
