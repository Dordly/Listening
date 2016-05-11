//
//  AnchorModel.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "AnchorModel.h"

@implementation AnchorModel


+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [AnchorLists class]};
}
@end
@implementation AnchorRecommend

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [ARecommend_List class]};
}

@end


@implementation ARecommend_List

@end


@implementation AnchorLists

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [ALists_List class]};
}

@end


@implementation ALists_List

@end


