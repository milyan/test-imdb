//
//  MSBaseTableViewController.h
//  datacappy
//
//  Created by Iurii Gubanov on 30.08.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseConfigureCellProtocol.h"
#import "ReuseIdentifierDispatcher.h"


@class BaseControllerViewModel;
@class ReuseIdentifierDispatcher;

@interface BaseTableViewController : UITableViewController

@property (strong, nonatomic) ReuseIdentifierDispatcher *dispatcher;
@property (strong, nonatomic) BaseControllerViewModel *viewModel;

@property (strong, nonatomic) NSMutableArray *mutableArray;

- (void)configureCell:(UITableViewCell<BaseConfigureCellProtocol> *)cell forViewModel:(id)viewModel;
- (void)registerNibWithClass:(Class)cellClass;
- (void)registerNibWithClass:(Class)cellClass withReuseIdentifier:(NSString *)reuseIdentifier;

@end
