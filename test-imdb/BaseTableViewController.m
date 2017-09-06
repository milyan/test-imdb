//
//  MSBaseTableViewController.m
//  datacappy
//
//  Created by Iurii Gubanov on 30.08.16.
//  Copyright © 2016 Iurii Gubanov. All rights reserved.
//

#import "BaseTableViewController.h"

//Pods
#import <ReactiveCocoa/ReactiveCocoa.h>

//Models
#import "BaseControllerViewModel.h"

//Extentions
#import "NSIndexSet+IndexPathes.h"


@interface BaseTableViewController ()

@property (nonatomic) RACDisposable *sectionsObservation;

@end

@implementation BaseTableViewController

- (ReuseIdentifierDispatcher *)dispatcher {
    if (!_dispatcher) {
        _dispatcher = [ReuseIdentifierDispatcher new];
    }
    return _dispatcher;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
    
    RAC(self, navigationItem.title) = RACObserve(self, viewModel.title);
    
    @weakify(self);
    self.sectionsObservation = [[self rac_valuesAndChangesForKeyPath:@keypath(self, mutableArray)
                                                             options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                                                            observer:self] subscribeNext:^(RACTuple *changesTuple) {
        @strongify(self);
        
        NSDictionary *change = changesTuple.second;
        
        NSKeyValueChange changeType = [change[NSKeyValueChangeKindKey] integerValue];
        NSIndexSet *indexes = change[NSKeyValueChangeIndexesKey];
        
        [self change:changeType indexes:[indexes indexPathes]];
    }];
    
    self.mutableArray = [NSMutableArray new];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.sections.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id viewModel = self.viewModel.sections[indexPath.row];
    NSString *reuseIdentifier = [self.dispatcher reuseIdentifierForViewModel:viewModel];
    NSString *message = [NSString stringWithFormat:@"ViewModel %@ not register.", NSStringFromClass([viewModel class])];
    NSAssert(reuseIdentifier, message);
    UITableViewCell<BaseConfigureCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    [self configureCell:cell forViewModel:viewModel];
    return cell;
}

#pragma mark - public methods

- (void)configureCell:(UITableViewCell<BaseConfigureCellProtocol> *)cell forViewModel:(id)viewModel {
    [cell configureWithViewModel:viewModel];
}

- (void)registerNibWithClass:(Class)cellClass {
    [self registerNibWithClass:cellClass withReuseIdentifier:NSStringFromClass(cellClass)];
}

- (void)registerNibWithClass:(Class)cellClass withReuseIdentifier:(NSString *)reuseIdentifier {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

#pragma mark - private methods

- (void)change:(NSKeyValueChange)changeType indexes:(NSArray <NSIndexPath *> *)indexes {
    switch (changeType) {
        case NSKeyValueChangeSetting: {
            [self.tableView reloadData];
            break;
        }
        case NSKeyValueChangeInsertion: {
            [self.tableView insertRowsAtIndexPaths:indexes
                                  withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
        case NSKeyValueChangeRemoval: {
            [self.tableView deleteRowsAtIndexPaths:indexes
                                  withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        }
        case NSKeyValueChangeReplacement: {
            [self.tableView reloadRowsAtIndexPaths:indexes
                                  withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
        default: {
            break;
        }
    }
}

@end
