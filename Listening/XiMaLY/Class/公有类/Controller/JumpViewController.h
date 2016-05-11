//
//  JumpViewController.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
  * (发现-热门更多)页面跳转视图, 负责初始化WMPageController  并跳转
 */
@interface JumpViewController : UIViewController
/** 控制器初始化 */
- (instancetype)initWithCategoryId:(NSInteger)categoryId contentType:(NSString *)type tag:(NSInteger)tag title:(NSString *)title;

@property (nonatomic,assign) NSInteger categoryId;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,assign) NSInteger tag;

@end
