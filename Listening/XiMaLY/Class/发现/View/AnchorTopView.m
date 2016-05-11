//
//  AnchorTopView.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "AnchorTopView.h"


@implementation AnchorTopView

- (void)awakeFromNib {
    
    self.iconImageButton.layer.cornerRadius = 40.f;
    self.iconImageButton.clipsToBounds = YES;

}

- (IBAction)handleTopViewButtonDidClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(anchorTopViewContentButton:)]) {
        [self.delegate anchorTopViewContentButton:sender];
    }
}

@end
