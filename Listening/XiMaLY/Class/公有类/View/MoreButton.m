//
//  MoreButton.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "MoreButton.h"

@interface MoreButton ()
@property (nonatomic,strong) UILabel *textLb;
@property (nonatomic,strong) UIImageView *iconIV;
@end

@implementation MoreButton

- (void)awakeFromNib
{
    self.imageView.contentMode = UIViewContentModeCenter;
}

static CGFloat textH = 0;

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    CGFloat titleY = 0;
    NSDictionary *dict = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:13]
                           };
    CGFloat titleW = 0;
    if ([UIDevice currentDevice].systemVersion.floatValue > 7.0) { // 判断运行时,及当前模拟器运行在哪个系统上
        
#ifdef __IPHONE_7_0 // 判断编译时 sdk7.0才允许编译
        titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil].size.width;
        textH = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil].size.height;
#else // sdk 6.0 编译下面
        titleW = [self.currentTitle sizeWithFont:[UIFont systemFontOfSize:13]].width;
        
#endif
    }else{
        titleW = [self.currentTitle sizeWithFont:[UIFont systemFontOfSize:13]].width;
    }
    
    
    CGFloat titleH = contentRect.size.height;
    CGFloat titleX = contentRect.size.width - textH - titleW;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = textH;
    CGFloat imageH = textH;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageY = contentRect.size.height/2 - textH/2;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}
@end
