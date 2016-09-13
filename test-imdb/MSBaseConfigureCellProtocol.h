//
//  MSBaseConfigureCellProtocol.h
//  datacappy
//
//  Created by Iurii Gubanov on 30.08.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MSBaseConfigureCellProtocol <NSObject>

@required
- (void)configureWithViewModel:(id)viewModel;

@end
