//
//  EditorCell.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditorDelegate <NSObject>

- (void)EditorCellDidClickfavButton:(NSIndexPath *)indexPath index:(NSUInteger)index;

- (void)EditorCellDidClickfavButton:(NSIndexPath *)indexPath index:(NSUInteger)index isAttracted:(BOOL)isAttacted;

@end
@interface EditorCell : UITableViewCell

@property (nonatomic,readwrite,weak) id<EditorDelegate> delegate;

@property (nonatomic,readwrite,strong) NSIndexPath *indexPath;

@property (nonatomic,strong) UIButton *coverBtn;

@property (nonatomic,strong) UILabel *titleLb;
// by 作者
@property (nonatomic,strong) UILabel *introLb;
// 播放次数
@property (nonatomic,strong) UILabel *playsLb;
// 集数
@property (nonatomic,strong) UILabel *tracksLb;

//收藏按钮
@property (nonatomic, strong)UIButton *favBtn;


@end
