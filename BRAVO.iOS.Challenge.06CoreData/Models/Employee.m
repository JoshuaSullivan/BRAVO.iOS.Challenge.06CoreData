#import "Employee.h"
#import "NRDImportConstants.h"

@interface Employee ()

// Private interface goes here.

@end


@implementation Employee

+ (void)importJSONData:(NSDictionary *)jsonData
           intoContext:(NSManagedObjectContext *)context;
{
    Employee *employee = [Employee insertInManagedObjectContext:context];
    
    employee.identifier = jsonData[kNRDIdentiferKey];
    employee.firstName = jsonData[kNRDFirstNameKey];
    employee.lastName = jsonData[kNRDLastNameKey];
    employee.hireDate = jsonData[kNRDHireDateKey];
}

@end
