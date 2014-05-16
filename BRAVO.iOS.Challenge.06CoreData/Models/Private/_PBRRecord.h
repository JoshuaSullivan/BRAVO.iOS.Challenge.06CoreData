// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PBRRecord.h instead.

#import <CoreData/CoreData.h>


extern const struct PBRRecordAttributes {
	__unsafe_unretained NSString *admin;
	__unsafe_unretained NSString *bravo;
	__unsafe_unretained NSString *client;
	__unsafe_unretained NSString *identifier;
	__unsafe_unretained NSString *pbrDate;
	__unsafe_unretained NSString *zero;
} PBRRecordAttributes;

extern const struct PBRRecordRelationships {
	__unsafe_unretained NSString *employee;
} PBRRecordRelationships;

extern const struct PBRRecordFetchedProperties {
} PBRRecordFetchedProperties;

@class Employee;








@interface PBRRecordID : NSManagedObjectID {}
@end

@interface _PBRRecord : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PBRRecordID*)objectID;





@property (nonatomic, strong) NSNumber* admin;



@property int16_t adminValue;
- (int16_t)adminValue;
- (void)setAdminValue:(int16_t)value_;

//- (BOOL)validateAdmin:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* bravo;



@property int16_t bravoValue;
- (int16_t)bravoValue;
- (void)setBravoValue:(int16_t)value_;

//- (BOOL)validateBravo:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* client;



@property int16_t clientValue;
- (int16_t)clientValue;
- (void)setClientValue:(int16_t)value_;

//- (BOOL)validateClient:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* identifier;



//- (BOOL)validateIdentifier:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* pbrDate;



//- (BOOL)validatePbrDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* zero;



@property int16_t zeroValue;
- (int16_t)zeroValue;
- (void)setZeroValue:(int16_t)value_;

//- (BOOL)validateZero:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Employee *employee;

//- (BOOL)validateEmployee:(id*)value_ error:(NSError**)error_;





@end

@interface _PBRRecord (CoreDataGeneratedAccessors)

@end

@interface _PBRRecord (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveAdmin;
- (void)setPrimitiveAdmin:(NSNumber*)value;

- (int16_t)primitiveAdminValue;
- (void)setPrimitiveAdminValue:(int16_t)value_;




- (NSNumber*)primitiveBravo;
- (void)setPrimitiveBravo:(NSNumber*)value;

- (int16_t)primitiveBravoValue;
- (void)setPrimitiveBravoValue:(int16_t)value_;




- (NSNumber*)primitiveClient;
- (void)setPrimitiveClient:(NSNumber*)value;

- (int16_t)primitiveClientValue;
- (void)setPrimitiveClientValue:(int16_t)value_;




- (NSString*)primitiveIdentifier;
- (void)setPrimitiveIdentifier:(NSString*)value;




- (NSDate*)primitivePbrDate;
- (void)setPrimitivePbrDate:(NSDate*)value;




- (NSNumber*)primitiveZero;
- (void)setPrimitiveZero:(NSNumber*)value;

- (int16_t)primitiveZeroValue;
- (void)setPrimitiveZeroValue:(int16_t)value_;





- (Employee*)primitiveEmployee;
- (void)setPrimitiveEmployee:(Employee*)value;


@end
