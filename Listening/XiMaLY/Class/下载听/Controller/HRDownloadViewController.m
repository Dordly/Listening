//
//  HRDownloadViewController.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "HRDownloadViewController.h"
#import "AlbumViewController.h"  // 专辑
#import "SoundViewController.h"  // 声音
#import "DownloadSongViewController.h"  // 下载中
@interface HRDownloadViewController ()

@end

@implementation HRDownloadViewController


+ (UINavigationController *)defaultdownloadUINavigationController
{
    static UINavigationController *nav = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       HRDownloadViewController *  downloadVC = [[HRDownloadViewController alloc] initWithViewControllerClasses:[self ViewControllerClasses] andTheirTitles:@[@"专辑",@"声音",@"下载中"]];
//        WMPageController的设置
        downloadVC.menuViewStyle = WMMenuViewStyleLine;
        // 设置背景色
        downloadVC.menuBGColor = [UIColor whiteColor];
        // 选中时颜色
        downloadVC.titleColorSelected = [UIColor redColor];
        // 设置每个item的宽
        downloadVC.itemsWidths = @[@(kWindowW/3),@(kWindowW/3),@(kWindowW/3)];
        
        downloadVC.progressHeight = 3.5;
        downloadVC.menuHeight = 45;
        downloadVC.viewFrame = CGRectMake(0, 20, kWindowW, kWindowH-20);
        nav = [[UINavigationController alloc] initWithRootViewController:downloadVC];
    });
    return nav;
}
// 存响应的控制器
+ (NSArray *)ViewControllerClasses
{
    return @[[AlbumViewController  class],
             [SoundViewController class],
             [DownloadSongViewController class]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;

}



@end
