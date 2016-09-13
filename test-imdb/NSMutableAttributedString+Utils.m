//
//  NSMutableAttributedString+Utils.m
//  test-imdb
//
//  Created by Iurii Gubanov on 13.09.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import "NSMutableAttributedString+Utils.h"

#import <UIKit/UIKit.h>

@implementation NSMutableAttributedString (Utils)

+ (NSMutableAttributedString *)attributedStringWithFirstString:(NSString *)firstString secondString:(NSString *)secondString {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@", firstString, secondString]];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, firstString.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(firstString.length + 1, secondString.length)];
    return attributedString;
}

@end
