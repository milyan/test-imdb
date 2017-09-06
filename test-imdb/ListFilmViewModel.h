//
//  ListFilmViewModel.h
//  test-imdb
//
//  Created by Iurii Gubanov on 12.09.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import "BaseControllerViewModel.h"

@interface ListFilmViewModel : BaseControllerViewModel

- (void)searchFilmWithString:(NSString *)string;

@end
