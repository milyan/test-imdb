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
    self.viewModel = [[DetailsFilmViewModel alloc] initWithFilm:self.object];
    [self racBinding];
}

- (void)racBinding {

    RAC(self.navigationItem, title) = RACObserve(self, viewModel.title);
    
    [self rac_liftSelector:@selector(updatePosterWithUrlString:) withSignals:RACObserve(self, viewModel.film.poster), nil];
    
    RAC(self.titleLabel, text) = RACObserve(self, viewModel.film.title);
    
    @weakify(self);
    RAC(self.prePlotLabel, text) = [RACObserve(self, viewModel.film.runtime) map:^NSString *(NSString *runtime) {
        @strongify(self);
        return [NSString stringWithFormat:@"%@ | %@ | %@", runtime, self.viewModel.film.genre, self.viewModel.film.released];
    }];
    
    RAC(self.plotLabel, text) = RACObserve(self, viewModel.film.plot);
    
    RAC(self.directorLabel, attributedText) = [[RACObserve(self, viewModel.film.director) ignore:nil] map:^NSAttributedString *(NSString *director) {
        return [NSMutableAttributedString attributedStringWithFirstString:@"Director:" secondString:director];
    }];
    
    RAC(self.writesLabel, attributedText) = [[RACObserve(self, viewModel.film.writer) ignore:nil] map:^NSAttributedString *(NSString *writer) {
        return [NSMutableAttributedString attributedStringWithFirstString:@"Writer:" secondString:writer];
    }];
    
    RAC(self.actorsLabel, attributedText) = [[RACObserve(self, viewModel.film.actors) ignore:nil] map:^NSAttributedString *(NSString *actors) {
        return [NSMutableAttributedString attributedStringWithFirstString:@"Actors:" secondString:actors];
    }];
}

- (void)updatePosterWithUrlString:(NSString *)urlString {
    [self.posterImageView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:[UIImage imageNamed:@"placeholder"]];
}

@end
