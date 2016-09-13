//
//  FilmViewModel.h
//  test-imdb
//
//  Created by Iurii Gubanov on 12.09.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilmViewModel : NSObject

@property (strong, nonatomic) id object;

- (instancetype)initWithObject:(id)object;

@end
