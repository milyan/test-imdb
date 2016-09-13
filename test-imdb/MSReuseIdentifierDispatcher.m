//
//  MSReuseIdentifierDispatcher.m
//  internalTask
//
//  Created by Iurii Gubanov on 30.08.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import "MSReuseIdentifierDispatcher.h"

@interface MSItemDispatcher : NSObject

@property (strong, nonatomic) NSString *reuseIdentifier;
@property (nonatomic) Class viewModelClass;

@end

@implementation MSItemDispatcher

@end

@interface MSReuseIdentifierDispatcher ()

@property (strong, nonatomic) NSMutableArray *items;

@end

@implementation MSReuseIdentifierDispatcher

- (void)registerReuseIdentifier:(NSString *)reuseIdentifier forViewModelClass:(Class)viewModelClass {
    
    MSItemDispatcher *itemDispatcher = [MSItemDispatcher new];
    itemDispatcher.reuseIdentifier = reuseIdentifier;
    itemDispatcher.viewModelClass = viewModelClass;

    if (self.items) {
        [self.items addObject:itemDispatcher];
    }
    else {
        self.items = [NSMutableArray arrayWithObject:itemDispatcher];
    }
}

- (NSString *)reuseIdentifierForViewModel:(id)ViewModel {
    
    for (MSItemDispatcher *item in self.items) {
        if ([ViewModel isMemberOfClass:item.viewModelClass]) {
            return item.reuseIdentifier;
        }
    }
    return self.defaultReuseIdentifier;
}

@end
