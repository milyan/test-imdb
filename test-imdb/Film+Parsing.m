//
//  Film+Parsing.m
//  task2
//
//  Created by Iurii Gubanov on 14.01.16.
//  Copyright © 2016 Юрий Губанов. All rights reserved.
//

#import "Film+Parsing.h"

#import "NSDateFormatter+Utils.h"

@implementation Film (Parsing)

- (instancetype)initWithValues:(NSDictionary *)values {
    if (self = [super init]) {
        self.identifier = values[@"trackId"];
        self.title = values[@"trackName"];
        self.poster = values[@"artworkUrl100"];
        NSDateFormatter *formatter = [NSDateFormatter parsingFormatter];
        self.releaseDate = [formatter dateFromString:values[@"releaseDate"]];
        self.genre = values[@"primaryGenreName"];
        self.longDescription = values[@"longDescription"];
        self.country = values[@"country"];
    }
    return self;
}

@end
