//
//  DestinationViewController.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  最终展示页控制器
 */
@interface DestinationViewController : UIViewController

// 选择接受外界title, 以及albumId 初始化
- (instancetype)initWithAlbumId:(NSInteger)albumId title:(NSString *)oTitle;
@property (nonatomic,assign) NSInteger albumId;
@property (nonatomic,strong) NSString *oTitle;

@end
