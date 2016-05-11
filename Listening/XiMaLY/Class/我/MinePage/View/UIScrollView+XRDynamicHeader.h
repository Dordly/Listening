//
//  UIScrollView+XRDynamicHeader.h
//  Day050601头像上传
//
//  Created by Apple on 16/5/6.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"

@interface DynamicHeaderImageView : UIImageView

/**父视图*/
@property (nonatomic, weak)UIScrollView * scrollView;

@property (nonatomic, copy)UserIconTapBlock block;

@end

@interface UIScrollView (XRDynamicHeader)

//添加一个可以变动的头视图
-(void)addDynamicHeaderWithImageName:(NSString *)imageName Height:(CGFloat)height UserIconTapBlock:(UserIconTapBlock)block;

@end
