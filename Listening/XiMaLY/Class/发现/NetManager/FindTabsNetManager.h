//
//  FindTabsNetManager.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "BaseNetManager.h"

@interface FindTabsNetManager : BaseNetManager
/**
 *  从网络上获取XMFind的标题菜单
 */
+ (id)getFindTabsCompletionHandle:(void(^)(id responseObject, NSError *error))completed;

/**  取从网络中获取的标题数组 */
@property (nonatomic,strong) NSArray *tabsList;

@end
