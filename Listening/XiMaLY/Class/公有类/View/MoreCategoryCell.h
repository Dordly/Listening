//
//  MoreCategoryCell.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreCategoryCell : UITableViewCell

@property (nonatomic,strong) UIButton *coverBtn;
@property (nonatomic,strong) UILabel *titleLb;
// by 作者
@property (nonatomic,strong) UILabel *introLb;
// 播放次数
@property (nonatomic,strong) UILabel *playsLb;
// 集数
@property (nonatomic,strong) UILabel *tracksLb;

- (void)bindAnchorAlbumsData:(NSDictionary *)albumDictionary;


@end
