//
//  SpecialTitleViewCell.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "SpecialTitleViewCell.h"

@interface SpecialTitleViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;

@end

@implementation SpecialTitleViewCell

- (void)awakeFromNib {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.iconImageView.layer.cornerRadius = 10.f;
    self.iconImageView.backgroundColor = [UIColor redColor];
    self.iconImageView.clipsToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)bindCellContentData:(NSDictionary *)dataDict {
    
    self.titleLabel.text = dataDict[@"title"];
    self.contentLabel.text = dataDict[@"intro"];
    self.authorLabel.text = dataDict[@"nickname"];
    
    [self.titleImageView setImage:[UIImage imageNamed:@"album_cover_bg"]];
    [self.iconImageView setImageWithURL:[NSURL URLWithString:dataDict[@"smallLogo"]] placeholderImage:[UIImage imageNamed:@"sound_default"]];
}


@end
