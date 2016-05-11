//
//  AnchorView.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  一个按钮 一label 一小按钮
 */
@protocol AnchorViewDelegate <NSObject>

- (void)anchorViewDidClickButtom:(NSIndexPath *)indexPath index:(NSUInteger)index;
- (void)anchorViewDidClickAttractButtom:(NSIndexPath *)indexPath index:(NSUInteger)index isAttracted:(BOOL)isAttacted;

@end

@interface AnchorView : UIView

@property (nonatomic,readwrite,weak) id<AnchorViewDelegate> delegate;

@property (nonatomic,readwrite,strong) NSIndexPath *indexPath;

@property (nonatomic,strong) UIButton *anchorBtn;
@property (nonatomic,strong) UILabel *nameLb;

@end
