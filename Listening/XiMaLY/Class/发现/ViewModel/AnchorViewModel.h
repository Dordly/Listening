//
//  AnchorViewModel.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "BaseViewModel.h"

/**
 *  主播VM
 */
@interface AnchorViewModel : BaseViewModel

// 分组数量
@property (nonatomic,assign) NSInteger section;

// 主播cover图片
- (NSURL *)coverURLForSection:(NSInteger)section Index:(NSInteger)index;
// 主播Name
- (NSString *)nameForSection:(NSInteger)section Index:(NSInteger)index;

/** 给TitleView的组title-----更多都为1*/
- (NSString *)mainTitleForSection:(NSInteger)section;
/** 给TitleView的组ID-----更多都为1*/
- (NSInteger)mainIDForSection:(NSInteger)section;
/** 给TitleView的组name-----更多都为1*/
- (NSString *)mainNameForSection:(NSInteger)section;

/**  获取主播uid */
- (NSUInteger)anthorUidForSection:(NSInteger)section Index:(NSInteger)index;


@end
