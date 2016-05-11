//
//  IDRoundButton.m
//  侧滑栏效果
//
//  Created by Apple on 16/4/14.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "IDRoundButton.h"

@implementation IDRoundButton

-(void)setCornerR:(CGFloat)cornerR
{
   
    self.layer.cornerRadius = cornerR;
}
-(CGFloat)cornerR
{
    return self.layer.cornerRadius;
}

-(void)setLineWidth:(CGFloat)lineWidth
{
    self.layer.borderWidth = lineWidth;
}

-(void)setLineColor:(UIColor *)lineColor
{
    self.layer.borderColor = lineColor.CGColor;
    
}
@end
