//
//  FocusImageScrollView.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
/**
 *  (头部滚动视图)
 */
@interface FocusImageScrollView : UIView
/**
 *  通过传入焦点图数量以及焦点图的图片路径,初始化一个View
 */
- (instancetype)initWithFocusImgNumber:(NSInteger)number;

// 给外界接受它的代理
@property (nonatomic,strong) iCarousel *ic;
@property (nonatomic,strong) UIPageControl *pageControl;

@end
