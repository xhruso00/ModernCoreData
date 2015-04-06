@import CoreData;
@import Foundation;

@class Item;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSString* title;
@property (nonatomic, assign) NSNumber* order;
@property (nonatomic, retain) Item* parent;
@property (nonatomic, retain) NSSet* children;

+ (instancetype)insertItemWithTitle:(NSString*)title
                             parent:(Item*)parent
             inManagedObjectContext:(NSManagedObjectContext*)managedObjectContext;

- (NSFetchedResultsController*)childrenFetchedResultsController;

@end