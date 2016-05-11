//
//  ContentShowView.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ContentShowViewDelegate <NSObject>

- (void)contentShowViewClick:(NSInteger)tag;

@end

/**
 *  自定义内容展示视图,绑定按钮 及 蒙版, 本身视图背景是个框
 */
@interface ContentShowView : UIView

@property (nonatomic, assign) id<ContentShowViewDelegate> delegate;
// 此View的背景视图(框)
@property (nonatomic,strong) UIImageView *bgImgView;
// 内容图片视图, 接受外界图片
@property (nonatomic,strong) UIImageView *contentImgView;
// 框框头上的三横线, 立体效果
@property (nonatomic,strong) UIImageView *xianImgVIew;
// 全view透明按钮
@property (nonatomic,strong) UIButton *button;
// 透明蒙版
@property (nonatomic,strong) UIView *coverView;
// 蒙版标签
@property (nonatomic,strong) UILabel *titleLb;
@end
