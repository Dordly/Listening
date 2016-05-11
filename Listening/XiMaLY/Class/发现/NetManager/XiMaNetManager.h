//
//  XiMaNetManager.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "BaseNetManager.h"
#import "XiMaLaYaModel.h"

@interface XiMaNetManager : BaseNetManager

+ (id)getRankListWithPageId:(NSInteger)pageId kCompletionHandle;

//获取音乐数组列表
+ (id)getAlbumWithId:(NSInteger)ID page:(NSInteger)pageId kCompletionHandle;

@end
