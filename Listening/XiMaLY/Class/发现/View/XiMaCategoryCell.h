//
//  XiMaCategoryCell.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XiMaCategoryCell : UITableViewCell
/** 序号标签 */
@property(nonatomic,strong) UILabel *orderLb;
/** 类型图片 */
@property(nonatomic,strong) UIImageView *iconIV;
/** 类型名称 */
@property(nonatomic,strong) UILabel *titleLb;
/** 类型描述 */
@property(nonatomic,strong) UILabel *descLb;
/** 集数 */
@property(nonatomic,strong) UILabel *numberLb;
/** 集数图标 */
@property(nonatomic,strong) UIImageView *numberIV;
@end






