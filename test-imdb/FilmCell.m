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

//Models
#import "Film.h"

//ViewModels
#import "FilmViewModel.h"

@interface FilmCell ()

@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

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
    self.typeLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    self.typeLabel.textColor = [UIColor lightGrayColor];
}

- (void)updateImageWithUrlString:(NSString *)urlString {
    [self.posterImageView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:[UIImage imageNamed:@"placeholder"]];
}

#pragma mark - MSBaseConfigureCellProtocol

- (void)configureWithViewModel:(FilmViewModel *)viewModel {
    Film *film = viewModel.object;
    self.titleLabel.text = film.title;
    self.yearLabel.text = [NSString stringWithFormat:@"%lu", film.year];
    self.typeLabel.text = film.type;
    [self updateImageWithUrlString:film.poster];
}

@end
