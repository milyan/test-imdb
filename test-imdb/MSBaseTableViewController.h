//
//  MSBaseTableViewController.h
//  datacappy
//
//  Created by Iurii Gubanov on 30.08.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MSBaseConfigureCellProtocol.h"
#import "MSReuseIdentifierDispatcher.h"

extern NSInteger const kDynamicHeightCell;

@class MSBaseControllerViewModel;
@class MSReuseIdentifierDispatcher;

@interface MSBaseTableViewController : UITableViewController

@property (strong, nonatomic) MSReuseIdentifierDispatcher *dispatcher;
@property (strong, nonatomic) MSBaseControllerViewModel *viewModel;

@property (strong, nonatomic) NSMutableArray *mutableArray;

- (void)configureCell:(UITableViewCell<MSBaseConfigureCellProtocol> *)cell forViewModel:(id)viewModel;
- (CGFloat)rowHeightForViewModel:(id)viewModel;
- (void)registerNibWithClass:(Class)cellClass;
- (void)registerNibWithClass:(Class)cellClass withReuseIdentifier:(NSString *)reuseIdentifier;

@end
