//
//  APIService.m
//  task2
//
//  Created by Юрий Губанов on 12.01.16.
//  Copyright © 2016 Юрий Губанов. All rights reserved.
//

#import "APIService.h"

#import <AFNetworking/AFNetworking.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

static AFHTTPSessionManager* _sessionManager = nil;

NSString *const kBaseURLString = @"https://itunes.apple.com/search?";

@implementation APIService

+ (AFHTTPSessionManager*)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURLString]
                                                   sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        _sessionManager.securityPolicy.allowInvalidCertificates = YES;
        _sessionManager.securityPolicy.validatesDomainName = NO;
    });
    return _sessionManager;
}

+ (RACSignal *)loadRequestWithParameters:(NSDictionary *)parameters {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        AFHTTPSessionManager* manager = [APIService sharedManager];

        void(^success)(NSURLSessionDataTask *, id) = ^(NSURLSessionDataTask *task, id responseObject) {
            [subscriber sendNext:responseObject];
            [subscriber sendCompleted];
        };
        void(^failure)(NSURLSessionDataTask *, NSError *) = ^(NSURLSessionDataTask *task, NSError *error) {
            [subscriber sendError:error];
            [subscriber sendCompleted];
        };
            
        [manager GET:@"" parameters:parameters progress:nil success:success failure:failure];

        return nil;
    }];
}

@end
