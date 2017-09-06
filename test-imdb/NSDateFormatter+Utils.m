//
//  NSDateFormatter+Utils.m
//  test-imdb
//
//  Created by Iurii Gubanov on 06.09.17.
//  Copyright © 2017 Iurii Gubanov. All rights reserved.
//

#import "NSDateFormatter+Utils.h"

@implementation NSDateFormatter (Utils)

+ (NSDateFormatter *)parsingFormatter {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    formatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    return formatter;
}

+ (NSDateFormatter *)viewFormatter {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateStyle = NSDateFormatterLongStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    return formatter;
}

@end
