//
//  HRSoundViewController.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "HRSoundViewController.h"
#import "CollectViewController.h"   // 收藏
#import "HistoryViewController.h"  // 历史
#import "FavoriteAnchorViewController.h"  // 关注

@interface HRSoundViewController ()

@end

@implementation HRSoundViewController

// 创建一个单例
+ (UINavigationController *)defaultSoundUINavigationController
{
    static UINavigationController * nav = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        HRSoundViewController * soundVC = [[HRSoundViewController alloc] initWithViewControllerClasses:[self ViewControllerClasses] andTheirTitles:@[@"关注",@"收藏",@"历史"]];
//        WMPageController的设置
        soundVC.menuViewStyle = WMMenuViewStyleLine;
        // 设置背景色
        soundVC.menuBGColor = [UIColor whiteColor];
        // 选中时颜色
        soundVC.titleColorSelected = [UIColor redColor];
        // 设置每个item的宽
        soundVC.itemsWidths = @[@(kWindowW/3),@(kWindowW/3),@(kWindowW/3)];
        soundVC.progressHeight = 3.5;
        soundVC.menuHeight = 45;
        soundVC.viewFrame = CGRectMake(0, 20, kWindowW, kWindowH-20);
        nav = [[UINavigationController alloc]initWithRootViewController:soundVC];
    });
    return nav;
}

// 存响应的控制器
+ (NSArray *)ViewControllerClasses {
    return @[[FavoriteAnchorViewController class],
             [CollectViewController class],
             [HistoryViewController class]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
}



@end
