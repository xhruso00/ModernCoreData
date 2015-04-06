@import Foundation;
@import CoreData;

typedef void (^InitCallbackBlock)(void);

@interface MCPersistenceController : NSObject

@property (strong, readonly) NSManagedObjectContext *managedObjectContext;

- (id)initWithCallback:(InitCallbackBlock)callback;
- (void)save;

@end