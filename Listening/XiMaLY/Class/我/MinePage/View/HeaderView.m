//
//  HeaderView.m
//  Listening
//
//  Created by Apple on 16/5/8.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

-(void)awakeFromNib
{
    self.userIconImage.layer.cornerRadius = 40;
    self.userIconImage.layer.masksToBounds = YES;
}
- (IBAction)userIconTapAction:(UITapGestureRecognizer *)sender {
    NSLog(@"已被点击");
    if(self.block)
    {
        self.block(self.userIconImage);
    }
}

@end
