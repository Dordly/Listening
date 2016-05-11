//
//  CategoryModel.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "BaseModel.h"

@class CategoryLists;
@interface CategoryModel : BaseModel

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<CategoryLists *> *list;

@end
@interface CategoryLists : BaseModel

@property (nonatomic, assign) BOOL selectedSwitch;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *coverPath;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) BOOL isFinished;

@property (nonatomic, copy) NSString *contentType;

@property (nonatomic, assign) NSInteger orderNum;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) BOOL isChecked;

@end

