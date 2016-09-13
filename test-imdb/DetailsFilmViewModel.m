//
//  DetailsFilmViewModel.m
//  test-imdb
//
//  Created by Iurii Gubanov on 13.09.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import "DetailsFilmViewModel.h"

//Labraries
#import <ReactiveCocoa/ReactiveCocoa.h>

//Models
#import "Film.h"

//Extentions
#import "Film+Services.h"

@implementation DetailsFilmViewModel

- (instancetype)initWithFilm:(Film *)film {
    if (self = [super init]) {
        _film = film;
        [self loadDetailsFilm];
    }
    return self;
}

- (void)loadDetailsFilm {
    [[self.film loadDetailsFilmByIdentifier] subscribeError:^(NSError *error) {
        NSLog(@"error = %@", error);
    }];
}

- (NSString *)title {
    return NSLocalizedString(@"Details", nil);
}

@end
