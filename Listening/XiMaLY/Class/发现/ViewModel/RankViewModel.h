//
//  RankViewModel.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "BaseViewModel.h"

@interface RankViewModel : BaseViewModel

/**  返回分组数 */
@property (nonatomic,assign) NSInteger sectionNumber;
/**  通过分组数返回行数 */
- (NSInteger)rowNumberForSection:(NSInteger)section;
/**  通过分组数返回主标题 */
- (NSString *)mainTitleForSection:(NSInteger)section;

/**  通过分组和行数, 返回图标coverURL */
- (NSURL *)coverURLForSection:(NSInteger)section row:(NSInteger)row;
/**  通过分组和行数, 返回Title */
- (NSString *)titleForSection:(NSInteger)section row:(NSInteger)row;
/**  通过分组和行数, 返回FirstTitle */
- (NSString *)firstTitleForSection:(NSInteger)section row:(NSInteger)row;
/**  通过分组和行数, 返回secondTitle */
- (NSString *)secondTitleForSection:(NSInteger)section row:(NSInteger)row;
/**  通过分组和行数, 返回RankKey */
- (NSString *)keyForSection:(NSInteger)section row:(NSInteger)row;
/**  通过分组和行数, 返回RankKey */
- (NSString *)contentTypeForSection:(NSInteger)section row:(NSInteger)row;
/**  是否 存在头部滚动视图 */
/** 头部滚动视图 图片总数 */
@property (nonatomic,assign) NSInteger focusImgNumber;
/** 头部滚动视图 图片URL */
- (NSURL *)focusImgURLForIndex:(NSInteger)index;
@end
