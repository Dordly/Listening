//
//  AlbumModel.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "AlbumModel.h"

@implementation AlbumModel

@end


@implementation AlbumAlbumModel

@end


@implementation AlbumTracksModel

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [AlbumTracksListModel class]};
}

@end


@implementation AlbumTracksListModel

@end


