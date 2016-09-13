//
//  MSReuseIdentifierDispatcher.h
//  internalTask
//
//  Created by Iurii Gubanov on 30.08.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSReuseIdentifierDispatcher : NSObject

@property (nonatomic, copy) NSString* defaultReuseIdentifier;

- (void)registerReuseIdentifier:(NSString*)reuseIdentifier forViewModelClass:(Class)viewModelClass;

- (NSString*)reuseIdentifierForViewModel:(id)ViewModel;

@end
