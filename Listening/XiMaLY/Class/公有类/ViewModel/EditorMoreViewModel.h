//
//  EditorMoreViewModel.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "BaseViewModel.h"

@interface EditorMoreViewModel : BaseViewModel

// 最大显示行数
@property (nonatomic,assign) NSInteger pageSize;
// 显示总行数
@property (nonatomic,assign) NSInteger rowNumber;

/**  通过分组数, 获取图标*/
- (NSURL *)coverURLForRow:(NSInteger)row;
/**  通过分组数, 获取标题(title)*/
- (NSString *)titleForRow:(NSInteger)row;
/**  通过分组数, 获取作者(intro)*/
- (NSString *)introForRow:(NSInteger)row;
/**  通过分组数, 获取播放次数*/
- (NSString *)playsForRow:(NSInteger)row;
/**  通过分组数, 获取集数*/
- (NSString *)tracksForRow:(NSInteger)row;

/**  通过分组数, 获取albumId*/
- (NSInteger)albumIdForRow:(NSInteger)row;

@end
