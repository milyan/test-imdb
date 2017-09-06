//
//  MSBaseControllerViewModel.h
//  datacappy
//
//  Created by Iurii Gubanov on 30.08.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseControllerViewModel : NSObject

@property (strong, nonatomic) NSMutableArray *sections;
@property (strong, nonatomic) NSString *title;

@end
