#import "_PBRRecord.h"

@interface PBRRecord : _PBRRecord {}

+ (void)importJSONData:(NSDictionary *)jsonData
           intoContext:(NSManagedObjectContext *)context;

@end
