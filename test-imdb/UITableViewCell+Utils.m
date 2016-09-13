//
//  UITableViewCell+Utils.m
//  datacappy
//
//  Created by Iurii Gubanov on 30.08.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import "UITableViewCell+Utils.h"

@implementation UITableViewCell (Utils)

- (CGFloat)systemCompressedHeightWithTableView:(UITableView *)tableView {
    self.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.frame), CGRectGetHeight(self.bounds));
    [self layoutIfNeeded];
    return ceil([self systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height) + 1;
}

@end
