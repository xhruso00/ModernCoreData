#import "AppDelegate.h"
#import "MCPersistenceController.h"
#import "ItemViewController.h"
#import "Store.h"

@interface AppDelegate ()

@property (nonatomic, strong) Store* store;
@property (strong, readwrite) MCPersistenceController *persistenceController;

- (void)completeUserInterface;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [self setPersistenceController:[[MCPersistenceController alloc] initWithCallback:^{
    [self completeUserInterface];
  }]];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  [[self persistenceController] save];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  [[self persistenceController] save];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  [[self persistenceController] save];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)completeUserInterface
{
  UINavigationController* navigationController = (UINavigationController*) self.window.rootViewController;
  navigationController.navigationBar.translucent = NO;
  ItemViewController* rootViewController = (ItemViewController*)navigationController.topViewController;
  NSAssert([rootViewController isKindOfClass:[ItemViewController class]], @"Should have an item view controller");
  self.store = [[Store alloc] init];
  self.store.managedObjectContext = self.persistenceController.managedObjectContext;
  rootViewController.parent = self.store.rootItem;
}

@end
