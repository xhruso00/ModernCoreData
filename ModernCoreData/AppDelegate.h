@import UIKit;
@import CoreData;
@class MCPersistenceController;


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, readonly) MCPersistenceController *persistenceController;

@end

