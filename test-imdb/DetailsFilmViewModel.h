//
//  DetailsFilmViewModel.h
//  test-imdb
//
//  Created by Iurii Gubanov on 13.09.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Film;
@interface DetailsFilmViewModel : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *titleFilm;
@property (strong, nonatomic) NSString *prePlot;
@property (strong, nonatomic) NSString *plot;
@property (strong, nonatomic) NSString *urlPoster;


- (instancetype)initWithFilm:(Film *)film;

@end
