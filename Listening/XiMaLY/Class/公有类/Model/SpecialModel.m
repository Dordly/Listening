//
//  SpecialModel.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "SpecialModel.h"

@implementation SpecialModel
+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [SpecialMoreList class]};
}
@end
@implementation SpecialMoreList

@end
