//
//  Film+Parsing.m
//  task2
//
//  Created by Iurii Gubanov on 14.01.16.
//  Copyright © 2016 Юрий Губанов. All rights reserved.
//

#import "Film+Parsing.h"

@implementation Film (Parsing)

- (instancetype)initWithValues:(NSDictionary *)values {
    if (self = [super init]) {
        self.identifier = values[@"imdbID"];
        self.title = values[@"Title"];
        self.poster = values[@"Poster"];
        self.year = [values[@"Year"] integerValue];
        self.type = values[@"Type"];
    }
    return self;
}

- (void)updateWithValues:(NSDictionary *)values {
    self.actors = values[@"Actors"];
    self.country = values[@"Country"];
    self.director = values[@"Director"];
    self.genre = values[@"Genre"];
    self.language = values[@"Language"];
    self.plot = values[@"Plot"];
    self.released = values[@"Released"];
    self.runtime = values[@"Runtime"];
    self.writer = values[@"Writer"];
}

@end
