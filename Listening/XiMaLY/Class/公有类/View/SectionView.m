//
//  SectionView.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "SectionView.h"

@implementation SectionView

// 使用外界传入集数值 初始化这个分组头
- (instancetype)initWithTotalTracks:(NSString *)tracks {
    if (self = [super init]) {
        _tracks = tracks;
    }
    return self;
}

@end
