#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Item;
@class NSFetchedResultsController;

@interface Store : NSObject

@property (nonatomic, strong) NSManagedObjectContext* managedObjectContext;

- (Item *)rootItem;

@end