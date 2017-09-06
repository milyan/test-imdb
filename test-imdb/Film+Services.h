//
//  Film+Services.h
//  task2
//
//  Created by Iurii Gubanov on 14.01.16.
//  Copyright © 2016 Юрий Губанов. All rights reserved.
//

#import "Film.h"

@class RACSignal;
@interface Film (Services)

+ (RACSignal *)loadFilmsWithString:(NSString *)string;

@end
