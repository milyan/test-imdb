//
//  Film+Services.m
//  task2
//
//  Created by Iurii Gubanov on 14.01.16.
//  Copyright © 2016 Юрий Губанов. All rights reserved.
//

#import "Film+Services.h"

#include <ReactiveCocoa/ReactiveCocoa.h>

#import "APIService.h"
#import "Film+Parsing.h"

@implementation Film (Services)

+ (RACSignal *)loadFilmsWithString:(NSString *)string {
    NSDictionary *parameters = @{@"term"      : string,
                                 @"entity"    : @"movie",
                                 };
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSMutableArray *results = [@[] mutableCopy];
        [[APIService loadRequestWithParameters:parameters] subscribeNext:^(id response) {
            NSArray *films = response[@"results"];
            for (NSDictionary *dict in films) {
                Film *film = [[Film alloc] initWithValues:dict];
                [results addObject:film];
            }
            [subscriber sendNext:results];
            [subscriber sendCompleted];
        } error:^(NSError *error) {
            [subscriber sendError:error];
            [subscriber sendCompleted];
        }];
        
        return nil;
    }];
}

@end
