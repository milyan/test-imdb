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
@property (nonatomic) NSInteger year;
@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSString *actors;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *director;
@property (nonatomic, strong) NSString *genre;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *plot;
@property (nonatomic, strong) NSString *released;
@property (nonatomic, strong) NSString *runtime;
@property (nonatomic, strong) NSString *writer;

@end
