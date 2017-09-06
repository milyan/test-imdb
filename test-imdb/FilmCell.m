//
//  FilmCell.m
//  task2
//
//  Created by Юрий Губанов on 14.01.16.
//  Copyright © 2016 Юрий Губанов. All rights reserved.
//

#import "FilmCell.h"

//Labraries
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <SDWebImage/UIImageView+WebCache.h>

//ViewModels
#import "FilmViewModel.h"

@interface FilmCell ()

@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;

@end

@implementation FilmCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configureCell];
}

#pragma mark - private methods

- (void)configureCell {
    self.titleLabel.font = [UIFont fontWithName:@"Helvetice-Bold" size:16];
    self.yearLabel.font = [UIFont fontWithName:@"Helvetiva" size:14];
    self.yearLabel.textColor = [UIColor lightGrayColor];
}

- (void)updateImageWithUrlString:(NSString *)urlString {
    NSURL *urlImage = [NSURL URLWithString:urlString];
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder"];
    [self.posterImageView sd_setImageWithURL:urlImage placeholderImage:placeholderImage];
}

#pragma mark - MSBaseConfigureCellProtocol

- (void)configureWithViewModel:(FilmViewModel *)viewModel {
    self.titleLabel.text = viewModel.titleFilm;
    self.yearLabel.text = [NSString stringWithFormat:@"%lu", (long)viewModel.year];
    [self updateImageWithUrlString:viewModel.urlPoster];
}

@end
