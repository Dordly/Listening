//
//  RankModel.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "RankModel.h"

@implementation RankModel


+ (NSDictionary *)objectClassInArray{
    return @{@"datas" : [RankDatas class]};
}
@end
@implementation RankFocusimages

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [RFocusImages_List class]};
}

@end


@implementation RFocusImages_List

@end


@implementation RankDatas

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [RDatas_List class]};
}

@end


@implementation RDatas_List

+ (NSDictionary *)objectClassInArray{
    return @{@"firstKResults" : [RDatas_List_Firstkresults class]};
}

@end


@implementation RDatas_List_Firstkresults

@end


