//
//  NSDateFormatter+Utils.h
//  test-imdb
//
//  Created by Iurii Gubanov on 06.09.17.
//  Copyright © 2017 Iurii Gubanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Utils)

+ (NSDateFormatter *)parsingFormatter;
+ (NSDateFormatter *)viewFormatter;

@end
