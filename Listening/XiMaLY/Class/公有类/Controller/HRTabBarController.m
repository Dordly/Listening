//
//  HRTabBarController.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "HRTabBarController.h"
#import "HRMeViewController.h"
#import "HRDownloadViewController.h"
#import "HRFindViewController.h"
#import "HRSoundViewController.h"
#import "HRNavigationController.h"

#import "LiveViewController.h"
#import "AnchorViewController.h"
#import "UserCenterViewController.h"
#import "PlayViewController.h"

@interface HRTabBarController ()

@end

@implementation HRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置子控制器
    UINavigationController *findNavi = [HRFindViewController defaultFindUINavigationController];
    [self setupChildController:findNavi imageName:@"tabbar_find_n" selectedImage:@"tabbar_find_h"];
    
    //下载听
    UINavigationController *download  = [HRDownloadViewController defaultdownloadUINavigationController];
  
    [self setupChildController:download imageName:@"tabbar_download_n" selectedImage:@"tabbar_download_h"];
    
    // 只占用空间--播放器
    PlayViewController * play = [PlayViewController new];
    [self setupChildController:play  imageName:nil selectedImage:nil];
    
    //定制听
    UINavigationController * sound  = [HRSoundViewController defaultSoundUINavigationController];
    
    [self setupChildController:sound imageName:@"tabbar_sound_n" selectedImage:@"tabbar_sound_h"];
    
 //  从独立的storyboard中获取一个控制器
//    UINavigationController * user = [UserCenterViewController defaultUserCenterNavigationController];
//    
//    [self setupChildController:user imageName:@"tabbar_me_n" selectedImage:@"tabbar_me_h"];
    
    HRMeViewController *meVC = [kStoryboard(@"MeSetting") instantiateViewControllerWithIdentifier:@"Me"];

    [self setupChildController:meVC imageName:@"tabbar_me_n" selectedImage:@"tabbar_me_h"];
    // 设置tabbar的背景图
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
    
}


/**  绑定各个控制器 */
- (void)setupChildController:(UIViewController *)vc imageName:(NSString *)imgName selectedImage:(NSString *)selectedImgName {
    // 设置图片间距
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    vc.tabBarItem.image = [UIImage imageNamed:imgName];
    // 设置图片的不渲染
    UIImage *image = [[UIImage imageNamed:selectedImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = image;
    [self addChildViewController:vc];
    
}

@end
