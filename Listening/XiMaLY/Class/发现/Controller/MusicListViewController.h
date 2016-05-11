//
//  MusicListViewController.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicListViewController : UIViewController
- (instancetype)initWithAlbumId:(NSInteger)albumId;
@property(nonatomic) NSInteger albumId;
@end










