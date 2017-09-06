//
//  FilmViewModel.m
//  test-imdb
//
//  Created by Iurii Gubanov on 12.09.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import "FilmViewModel.h"

#import "Film.h"

@implementation FilmViewModel

- (instancetype)initWithFilm:(Film *)film {
    if (self = [super init]) {
        _year = film.year;
        _titleFilm = film.title;
        _urlPoster = film.poster;
        _film = film;
    }
    return self;
}

@end
