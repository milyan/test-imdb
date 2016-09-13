#import <Foundation/Foundation.h>


@interface NSIndexSet (IndexPathes)

- (NSArray <NSIndexPath *> *)indexPathesInSection:(NSInteger)section;

// Index pathes in section 0. 
- (NSArray <NSIndexPath *> *)indexPathes;

@end
