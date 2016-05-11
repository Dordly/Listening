//
//  CategoryViewModel.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "BaseViewModel.h"
/**
 *  分类VM
 */
@interface CategoryViewModel : BaseViewModel

// 返回list个数
@property (nonatomic,assign) NSInteger listsCount;

/** 获取图标接口 */
- (NSURL *)coverURLForIndex:(NSInteger)index;
/** 获取Title接口 */
- (NSString *)titleForIndex:(NSInteger)index;

/** 获取ID接口 */
- (NSInteger)IDForIndex:(NSInteger)index;

/** 获取Type接口 */
- (NSString *)contentTypeForIndex:(NSInteger)index;

@end
