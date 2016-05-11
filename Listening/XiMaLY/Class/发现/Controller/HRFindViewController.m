//
//  HRFindViewController.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "HRFindViewController.h"
#import "HomePageViewController.h"
#import "CategoryViewController.h"
#import "LiveViewController.h"
#import "RankingViewController.h"
#import "AnchorViewController.h"

@interface HRFindViewController ()

@end

@implementation HRFindViewController

+ (UINavigationController *)defaultFindUINavigationController {
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       HRFindViewController *findVC = [[HRFindViewController alloc] initWithViewControllerClasses:[self ViewControllerClasses] andTheirTitles:@[@"推荐",@"分类",@"榜单",@"电台",@"主播"]];
//        WMPageController的设置
        findVC.menuViewStyle = WMMenuViewStyleLine;
        // 设置每个item的宽
        findVC.itemsWidths = @[@(kWindowW/5),@(kWindowW/5),@(kWindowW/5)];
        findVC.progressColor = [UIColor redColor];
        findVC.progressHeight = 3;
        findVC.menuHeight = 40;
        navi = [[UINavigationController alloc] initWithRootViewController:findVC];
    });
    return navi;
}

// 存响应的控制器
+ (NSArray *)ViewControllerClasses {
    return @[[HomePageViewController class],
             [CategoryViewController class],
             [RankingViewController class],
             [LiveViewController class],
             [AnchorViewController class]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = NSLocalizedString(@"发现","");
    
    NSLog(@"%@",NSStringFromCGPoint(self.scrollView.contentOffset));
}
@end
