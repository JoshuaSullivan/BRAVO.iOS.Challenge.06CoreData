#import "_Employee.h"

@interface Employee : _Employee {}

+ (Employee *)importJSONData:(NSDictionary *)jsonData
                 intoContext:(NSManagedObjectContext *)context;

- (void)createRelationshipsUsingEmployeeDict:(NSDictionary *)employeeDict;


@end
