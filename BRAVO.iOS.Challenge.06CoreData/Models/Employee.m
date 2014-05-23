#import "Employee.h"
#import "NRDImportConstants.h"

@interface Employee ()

// Private interface goes here.

@end


@implementation Employee

+ (void)importJSONData:(NSDictionary *)jsonData
           intoContext:(NSManagedObjectContext *)context
{
    Employee *employee = [Employee insertInManagedObjectContext:context];
    
    employee.identifier = jsonData[kNRDIdentiferKey];
    employee.firstName = jsonData[kNRDFirstNameKey];
    employee.lastName = jsonData[kNRDLastNameKey];
    
//    static NSDateFormatter *dateFormatter = nil;
//    if (!dateFormatter) {
//        dateFormatter = [[NSDateFormatter alloc] init];
//        [dateFormatter setDateFormat:@"MM/dd/yyyy"];
//    }
    
    NSDateFormatter *dateFormatter = nil;
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    
    employee.hireDate = [dateFormatter dateFromString:jsonData[kNRDHireDateKey]];
    
    NSError *error;
    
    if (![context save:&error]) {
        NSLog(@"%@", error.localizedDescription);
    }
}

@end
