@import Foundation;
@import UIKit;

@class FetchedResultsControllerDataSource;
@class Store;
@class Item;

@interface ItemViewController : UITableViewController

@property (nonatomic, strong) Item *parent;

@end