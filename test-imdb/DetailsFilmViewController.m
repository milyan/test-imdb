//
//  DetailsFilmViewController.m
//  task2
//
//  Created by Юрий Губанов on 14.01.16.
//  Copyright © 2016 Юрий Губанов. All rights reserved.
//

#import "DetailsFilmViewController.h"

//Labraries
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <SDWebImage/UIImageView+WebCache.h>

//Models
#import "Film.h"

//ViewModels
#import "DetailsFilmViewModel.h"

//Extentions
#import "NSMutableAttributedString+Utils.h"

@interface DetailsFilmViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *prePlotLabel;
@property (weak, nonatomic) IBOutlet UILabel *plotLabel;
@property (weak, nonatomic) IBOutlet UILabel *directorLabel;
@property (weak, nonatomic) IBOutlet UILabel *writesLabel;
@property (weak, nonatomic) IBOutlet UILabel *actorsLabel;

@property (strong, nonatomic) DetailsFilmViewModel *viewModel;

@end

@implementation DetailsFilmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[DetailsFilmViewModel alloc] initWithFilm:self.film];
    [self racBinding];
}

- (void)racBinding {

    RAC(self.navigationItem, title) = RACObserve(self, viewModel.title);
    
    [self rac_liftSelector:@selector(updatePosterWithUrlString:) withSignals:RACObserve(self, viewModel.urlPoster), nil];
    
    RAC(self.titleLabel, text) = RACObserve(self, viewModel.titleFilm);
    
    RAC(self.prePlotLabel, text) = RACObserve(self, viewModel.prePlot);
    
    RAC(self.plotLabel, text) = RACObserve(self, viewModel.plot);
    
}

- (void)updatePosterWithUrlString:(NSString *)urlString {
    NSURL *URLImage = [NSURL URLWithString:urlString];
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder"];
    [self.posterImageView sd_setImageWithURL:URLImage placeholderImage:placeholderImage];
}

@end
