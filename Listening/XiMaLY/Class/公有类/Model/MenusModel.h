//
//  MenusModel.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "BaseModel.h"

@class MenuLists;
@interface MenusModel : BaseModel

@property (nonatomic, assign) BOOL hasRecommendedZones;

@property (nonatomic, assign) BOOL isFinished;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<MenuLists *> *list;

@property (nonatomic, assign) NSInteger ret;

@end
@interface MenuLists : BaseModel

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, assign) NSInteger category_id;

@end

