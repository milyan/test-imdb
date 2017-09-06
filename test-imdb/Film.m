//
//  Film.m
//  task2
//
//  Created by Iurii Gubanov on 14.01.16.
//  Copyright © 2016 Юрий Губанов. All rights reserved.
//

#import "Film.h"

@implementation Film

- (NSInteger)year {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger year = [calendar component:NSCalendarUnitYear fromDate:self.releaseDate];
    return year;
}

@end
