//
//  SpecialSongViewController.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>

/**  发现-推荐-精品听单控制器 */
@interface SpecialSongViewController : UIViewController

@property (nonatomic,readwrite,strong) NSString *specialTitle;
@property (nonatomic,readwrite,assign) NSUInteger specialId;

@end
