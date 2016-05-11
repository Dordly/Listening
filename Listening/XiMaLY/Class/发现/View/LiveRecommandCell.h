//
//  LiveRecommandCell.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  三个图片按钮, 三个按钮名称
 */
@interface LiveRecommandCell : UITableViewCell

@property (nonatomic,strong) UIButton *radioBtn0;
@property (nonatomic,strong) UIButton *radioBtn1;
@property (nonatomic,strong) UIButton *radioBtn2;

@property (nonatomic,strong) UILabel *nameLb0;
@property (nonatomic,strong) UILabel *nameLb1;
@property (nonatomic,strong) UILabel *nameLb2;
@end
