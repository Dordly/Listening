//
//  SpecialCell.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  精品听单Cell
 */
@interface SpecialCell : UITableViewCell

@property (nonatomic,strong) UIButton *coverBtn;
@property (nonatomic,strong) UILabel *titleLb;
@property (nonatomic,strong) UILabel *subTitleLb;
// 10张专辑
@property (nonatomic,strong) UILabel *footNoteLb;
@end
