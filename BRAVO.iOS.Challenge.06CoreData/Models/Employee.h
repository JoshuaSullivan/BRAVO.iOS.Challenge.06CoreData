#import "_Employee.h"

@interface Employee : _Employee {}

+ (void)importJSONData:(NSDictionary *)jsonData
           intoContext:(NSManagedObjectContext *)context;

@end
