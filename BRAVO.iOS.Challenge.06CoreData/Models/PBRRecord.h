#import "_PBRRecord.h"

@interface PBRRecord : _PBRRecord {}

+ (PBRRecord *)importJSONData:(NSDictionary *)jsonData
                  intoContext:(NSManagedObjectContext *)context;

@end
