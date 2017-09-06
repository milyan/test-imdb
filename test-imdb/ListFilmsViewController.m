//
//  ListFilmsViewController.m
//  task2
//
//  Created by Iurii Gubanov on 14.01.16.
//  Copyright © 2016 Юрий Губанов. All rights reserved.
//

#import "ListFilmsViewController.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

//Views
#import "FilmCell.h"

//Controllers
#import "DetailsFilmViewController.h"

//Extentions
#import "UIView+Utils.h"
#import "Film+Services.h"

//ViewModels
#import "ListFilmViewModel.h"
#import "FilmViewModel.h"
#import "BaseTableViewController.h"

NSUInteger const FilmCellRowHeight = 166;

NSString* const kSegueDetailsFilmVC = @"segueDetailsFilmVC";

@interface ListFilmsViewController () <UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) ListFilmViewModel *viewModel;

@end

@implementation ListFilmsViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = self.searchBar;
    self.viewModel = [ListFilmViewModel new];
    self.viewModel.sections = [self mutableArrayValueForKey:@keypath(self, mutableArray)];
    [self registerNibWithClass:[FilmCell class]];
    [self.dispatcher registerReuseIdentifier:[FilmCell className] forViewModelClass:[FilmViewModel class]];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    FilmViewModel *viewModel = self.viewModel.sections[indexPath.row];
    [self performSegueWithIdentifier:kSegueDetailsFilmVC sender:viewModel.film];
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.viewModel searchFilmWithString:searchBar.text];
    [searchBar resignFirstResponder];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kSegueDetailsFilmVC]) {
        DetailsFilmViewController *controller = segue.destinationViewController;
        controller.film = sender;
    }
}

@end
