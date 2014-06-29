// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PBRRecord.h instead.

#import <CoreData/CoreData.h>


extern const struct PBRRecordAttributes {
	__unsafe_unretained NSString *adminHours;
	__unsafe_unretained NSString *bravoHours;
	__unsafe_unretained NSString *clientHours;
	__unsafe_unretained NSString *pbrId;
	__unsafe_unretained NSString *weekStartingDate;
	__unsafe_unretained NSString *zeroHours;
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





@property (nonatomic, strong) NSDecimalNumber* adminHours;



//- (BOOL)validateAdminHours:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDecimalNumber* bravoHours;



//- (BOOL)validateBravoHours:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDecimalNumber* clientHours;



//- (BOOL)validateClientHours:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* pbrId;



//- (BOOL)validatePbrId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* weekStartingDate;



//- (BOOL)validateWeekStartingDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDecimalNumber* zeroHours;



//- (BOOL)validateZeroHours:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Employee *employee;

//- (BOOL)validateEmployee:(id*)value_ error:(NSError**)error_;





@end

@interface _PBRRecord (CoreDataGeneratedAccessors)

@end

@interface _PBRRecord (CoreDataGeneratedPrimitiveAccessors)


- (NSDecimalNumber*)primitiveAdminHours;
- (void)setPrimitiveAdminHours:(NSDecimalNumber*)value;




- (NSDecimalNumber*)primitiveBravoHours;
- (void)setPrimitiveBravoHours:(NSDecimalNumber*)value;




- (NSDecimalNumber*)primitiveClientHours;
- (void)setPrimitiveClientHours:(NSDecimalNumber*)value;




- (NSString*)primitivePbrId;
- (void)setPrimitivePbrId:(NSString*)value;




- (NSDate*)primitiveWeekStartingDate;
- (void)setPrimitiveWeekStartingDate:(NSDate*)value;




- (NSDecimalNumber*)primitiveZeroHours;
- (void)setPrimitiveZeroHours:(NSDecimalNumber*)value;





- (Employee*)primitiveEmployee;
- (void)setPrimitiveEmployee:(Employee*)value;


@end
