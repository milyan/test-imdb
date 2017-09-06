//
//  Film.h
//  task2
//
//  Created by Iurii Gubanov on 14.01.16.
//  Copyright © 2016 Юрий Губанов. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Film : NSObject

@property (nonatomic, strong) NSNumber *identifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *poster;
@property (nonatomic, strong) NSDate *releaseDate;
@property (nonatomic, strong) NSString *longDescription;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *genre;

@property (nonatomic) NSInteger year;

@end
