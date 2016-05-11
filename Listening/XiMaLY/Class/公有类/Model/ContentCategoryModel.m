//
//  ContentCategoryModel.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "ContentCategoryModel.h"

@implementation ContentCategoryModel


+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [CategoryList class]};
}
@end
@implementation CategoryList

@end


