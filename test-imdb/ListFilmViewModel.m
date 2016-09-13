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

static NSUInteger pageSize = 10;

@interface ListFilmViewModel ()

@property (nonatomic) NSUInteger page;
@property (nonatomic) BOOL isLastPage;

@end

@implementation ListFilmViewModel

- (NSString *)title {
    return NSLocalizedString(@"Search", nil);
}

#pragma mark - private methods

- (void)loadFilmsWithPage:(NSUInteger)page {
    if (!self.isLastPage) {
        @weakify(self);
        [[Film loadFilmsWithString:self.searchString page:page] subscribeNext:^(NSArray *films) {
            @strongify(self);
            for (Film *film in films) {
                FilmViewModel *viewModel = [[FilmViewModel alloc] initWithObject:film];
                [self.sections insertObject:viewModel atIndex:self.sections.count];
            }
            self.isLastPage = films.count != pageSize;
        } error:^(NSError *error) {
            NSLog(@"error = %@", error);
        }];
    }
}

#pragma mark - public methods

- (void)loadNextPage {
    [self loadFilmsWithPage:++self.page];
}

#pragma mark - Accessory methods

- (void)setSearchString:(NSString *)searchString {
    _searchString = searchString;
    [self.sections removeAllObjects];
    self.isLastPage = NO;
    self.page = 1;
    [self loadFilmsWithPage:self.page];
}

@end
