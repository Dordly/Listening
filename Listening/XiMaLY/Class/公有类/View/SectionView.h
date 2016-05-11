//
//  SectionView.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  第0组分组头
 */
@interface SectionView : UIView

// 使用外界传入集数值 初始化这个分组头
- (instancetype)initWithTotalTracks:(NSString *)tracks;
@property (nonatomic,strong) NSString *tracks;

@end
