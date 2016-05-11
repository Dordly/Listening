//
//  SpecialModel.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "BaseModel.h"
/**
 *  精品听单栏模型
 */
@class SpecialMoreList;
@interface SpecialModel : BaseModel

@property (nonatomic, assign) NSInteger pageId;

@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, copy) NSString *moduleTitle;

@property (nonatomic, strong) NSArray<SpecialMoreList *> *list;

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *msg;

@end
@interface SpecialMoreList : BaseModel

@property (nonatomic, assign) NSInteger specialId;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *coverPathSmall;

@property (nonatomic, assign) NSInteger contentType;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *footnote;

@property (nonatomic, copy) NSString *coverPathBig;

@property (nonatomic, assign) long long releasedAt;

@property (nonatomic, assign) BOOL isHot;

@end

