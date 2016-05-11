//
//  DataBaseManager.h
//  Listening
//
//  Created by Apple on 16/5/9.
//  Copyright © 2016年 HansRove. All rights reserved.
//

//数据库管理类

#import <Foundation/Foundation.h>

@interface DataBaseManager : NSObject

+(instancetype)shareManager;

//创建数据库表
-(BOOL)createTableFromClass:(Class)objcClass;

//在数据库表中添加一条记录
-(BOOL)insertTableWithObject:(id)object;

//判断数据是否存在
-(BOOL)isExistWithObject:(id)object;

//删除数据库表中的记录
-(BOOL)delegateTableRecordWithObject:(id)object;

//获取表中所有的记录
-(NSArray *)getAllObjectFromClass:(Class)objcClassX;

@end
