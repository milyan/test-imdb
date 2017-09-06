//
//  FilmViewModel.h
//  test-imdb
//
//  Created by Iurii Gubanov on 12.09.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Film;
@interface FilmViewModel : NSObject

@property (strong, nonatomic) Film *film;
@property (nonatomic) NSInteger year;
@property (strong, nonatomic) NSString *urlPoster;
@property (strong, nonatomic) NSString *titleFilm;

- (instancetype)initWithFilm:(Film *)film;

@end
