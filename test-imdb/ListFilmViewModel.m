//
//  ListFilmViewModel.m
//  test-imdb
//
//  Created by Iurii Gubanov on 12.09.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import "ListFilmViewModel.h"

//Labraries
#import <ReactiveCocoa/ReactiveCocoa.h>

//Extentions
#import "Film+Services.h"

//ViewModels
#import "FilmViewModel.h"

@implementation ListFilmViewModel

- (NSString *)title {
    return NSLocalizedString(@"Search", nil);
}

#pragma mark - public methdos

- (void)searchFilmWithString:(NSString *)string {
    [self.sections removeAllObjects];
    @weakify(self);
    [[Film loadFilmsWithString:string] subscribeNext:^(NSArray *films) {
        @strongify(self);
        for (Film *film in films) {
            FilmViewModel *viewModel = [[FilmViewModel alloc] initWithFilm:film];
            [self.sections insertObject:viewModel atIndex:self.sections.count];
        }
    } error:^(NSError *error) {
        NSLog(@"error = %@", error);
    }];
}

@end
