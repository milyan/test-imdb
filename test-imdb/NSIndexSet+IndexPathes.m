#import "NSIndexSet+IndexPathes.h"

// Libraries.
#import <UIKit/UIKit.h>


@implementation NSIndexSet (IndexPathes)

- (NSArray <NSIndexPath *> *)indexPathesInSection:(NSInteger)section {
	NSMutableArray <NSIndexPath *> *indexPathes = [[NSMutableArray alloc] initWithCapacity:self.count];
	
	[self enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * stop) {
			NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:section];
			[indexPathes addObject:indexPath];
		}];
	
	return indexPathes;
}

- (NSArray <NSIndexPath *> *)indexPathes {
	return [self indexPathesInSection:0];
}

@end
