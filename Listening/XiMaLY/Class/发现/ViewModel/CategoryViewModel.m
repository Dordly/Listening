//
//  CategoryViewModel.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//
#import "CategoryViewModel.h"
#import "HomePageNetManager.h"
#import "CategoryModel.h"

@interface CategoryViewModel ()
@property (nonatomic,strong) CategoryModel *model;
@end

@implementation CategoryViewModel

- (void)getDataCompletionHandle:(void (^)(NSError *))completed {
    self.dataTask = [HomePageNetManager getCategoryPageCompletionHandle:^(CategoryModel* responseObject, NSError *error) {
        self.model = responseObject;
        completed(error);
    }];
}
- (NSInteger)listsCount {
    return self.model.list.count;
}
/** 获取图标接口 */
- (NSURL *)coverURLForIndex:(NSInteger)index {
    NSString *path = self.model.list[index].coverPath;
    return [NSURL URLWithString:path];
}
/** 获取Title接口 */
- (NSString *)titleForIndex:(NSInteger)index {
    return self.model.list[index].title;
}

/** 获取ID接口 */
- (NSInteger)IDForIndex:(NSInteger)index {
    return self.model.list[index].ID;
}

/** 获取Type接口 */
- (NSString *)contentTypeForIndex:(NSInteger)index {
    return self.model.list[index].contentType;
}

@end
