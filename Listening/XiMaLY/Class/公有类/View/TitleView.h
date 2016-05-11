//
//  TitleView.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>

// 监听更多按钮点击事件协议
@protocol TitleViewDelegate <NSObject>

- (void)titleViewDidClickSection:(NSInteger)section;

@end

@interface TitleView : UIView

// 添加代理
@property (nonatomic,weak) id<TitleViewDelegate> delegate;

- (instancetype)initWithTitle:(NSString *)title hasMore:(BOOL)more;

/**  标题 */
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) UILabel *titleLb;

// 记录section
@property (nonatomic,readwrite,assign) NSUInteger section;

@end
