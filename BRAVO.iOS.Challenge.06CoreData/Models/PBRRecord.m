#import "PBRRecord.h"
#import "NRDImportConstants.h"


@interface PBRRecord ()

// Private interface goes here.

@end


@implementation PBRRecord

+ (PBRRecord *)importJSONData:(NSDictionary *)jsonData
                  intoContext:(NSManagedObjectContext *)context
{
    PBRRecord *record = [PBRRecord insertInManagedObjectContext:context];
    
    record.identifier = jsonData[kNRDIdentiferKey];
    record.admin = jsonData[kNRDPBRAdminKey];
    record.bravo = jsonData[kNRDPBRBravoKey];
    record.zero = jsonData[kNRDPBRZeroKey];
    record.client = jsonData[kNRDPBRClientKey];
    
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    }
    
//    NSDateFormatter *dateFormatter = nil;
//    dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    

    record.pbrDate = [dateFormatter dateFromString:jsonData[kNRDPBRDateKey]];
    NSError *error;
    
    if (![context save:&error]) {
        NSLog(@"%@", error.localizedDescription);
    }
    
    return record;
}

@end
