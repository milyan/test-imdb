//
//  APIService.h
//  task2
//
//  Created by Юрий Губанов on 12.01.16.
//  Copyright © 2016 Юрий Губанов. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal;
@interface APIService : NSObject

+ (RACSignal *)loadRequestWithParameters:(NSDictionary *)parameters;

@end
