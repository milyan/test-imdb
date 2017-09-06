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
#import "NSDateFormatter+Utils.h"

@interface DetailsFilmViewModel ()

@property (strong, nonatomic) Film* film;

@end

@implementation DetailsFilmViewModel

- (instancetype)initWithFilm:(Film *)film {
    if (self = [super init]) {
        _film = film;
        _urlPoster = film.poster;
        _plot = film.longDescription;
        _titleFilm = film.title;
        NSDateFormatter *formatter = [NSDateFormatter viewFormatter];
        _prePlot = [NSString stringWithFormat:@"%@ | %@ | %@", film.genre, film.country, [formatter stringFromDate:film.releaseDate]];
    }
    return self;
}

- (NSString *)title {
    return NSLocalizedString(@"Details", nil);
}

@end
