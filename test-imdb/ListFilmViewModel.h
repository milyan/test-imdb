//
//  ListFilmViewModel.h
//  test-imdb
//
//  Created by Iurii Gubanov on 12.09.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import "MSBaseControllerViewModel.h"

@interface ListFilmViewModel : MSBaseControllerViewModel

@property (nonatomic, strong) NSString *searchString;

- (void)loadNextPage;

@end
