//
//  UIView+Utils.m
//  datacappy
//
//  Created by Iurii Gubanov on 30.08.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import "UIView+Utils.h"

@implementation UIView (Utils)

+ (NSString *)className {
    return NSStringFromClass([self class]);
}

+ (instancetype)loadFromNib {
    return [[NSBundle mainBundle] loadNibNamed:[self className] owner:self options:nil].firstObject;
}

@end
