//
//  MSReuseIdentifierDispatcher.h
//  internalTask
//
//  Created by Iurii Gubanov on 30.08.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReuseIdentifierDispatcher : NSObject

- (void)registerReuseIdentifier:(NSString*)reuseIdentifier forViewModelClass:(Class)viewModelClass;
- (NSString*)reuseIdentifierForViewModel:(id)ViewModel;

@end
