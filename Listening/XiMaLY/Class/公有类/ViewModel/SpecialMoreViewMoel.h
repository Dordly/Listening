//
//  SpecialMoreViewMoel.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//
#import "BaseViewModel.h"
/**
 *  精品听单栏VM
 */
@interface SpecialMoreViewMoel : BaseViewModel

// 加载页变化
@property (nonatomic,assign) NSInteger page;

// 以时间, 获取相应的分组数
@property (nonatomic,assign) NSInteger section;

/** 通过分组数, 以时间, 获取相应的行数*/
- (NSInteger)rowNumberForSection:(NSInteger)section;

- (NSURL *)coverURLForSection:(NSInteger)section row:(NSInteger)index;
- (NSString *)titleForSection:(NSInteger)section row:(NSInteger)index;
- (NSUInteger)albumIDForSection:(NSInteger)section index:(NSInteger)index;
// 详情
- (NSString *)trackTitleForSection:(NSInteger)section row:(NSInteger)index;
/** 几个声音 */
- (NSString *)footNoteForSection:(NSInteger)section row:(NSInteger)index;
/** 根据分组获取,组头title */
- (NSString *)mainTitleForSection:(NSInteger)section;

@end
