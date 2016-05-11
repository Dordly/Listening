//
//  UserCenterViewController.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "UserCenterViewController.h"
#import "UserCenterNomalCell.h"
#import "UserCenterInfoView.h"
#import "AccountSettingViewController.h"
#import "LoginViewController.h"
#import "FavoriteAnchorViewController.h"
#import "DownloadSongViewController.h"
#import "SettingViewController.h"

@interface UserCenterViewController ()<
UITableViewDataSource,UITableViewDelegate,
UserCenterInfoViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,readwrite,strong) NSArray *settingArray;

@property (nonatomic,readwrite,strong) UserCenterInfoView *infoView;

@end

static NSString *const nomalCellIdentifier = @"UserCenterNomalCell";
@implementation UserCenterViewController

+ (UINavigationController *)defaultUserCenterNavigationController {
    
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UserCenterViewController *userCenterVC = [[UserCenterViewController alloc] initWithNibName:@"UserCenterViewController" bundle:nil];
        navi = [[UINavigationController alloc] initWithRootViewController:userCenterVC];
    });
    return navi;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.settingArray = @[
                          @[
                              @{@"icon":@"",@"title":@"我的发布",@"ctrlVC":@""},
                              @{@"icon":@"",@"title":@"我的圈子",@"ctrlVC":@""}
                              ],
                          @[
                              @{@"icon":@"",@"title":@"我的赞",@"ctrlVC":@""},
                              @{@"icon":@"",@"title":@"我的评价",@"ctrlVC":@""},
                              @{@"icon":@"",@"title":@"我的转发",@"ctrlVC":@""}
                              ],
                          ];
 
    [self.tableView registerNib:[UINib nibWithNibName:nomalCellIdentifier bundle:nil] forCellReuseIdentifier:nomalCellIdentifier];
    [self setupTableViewHeader];
    
    if (![self loginStatus]) {
        UIStoryboard * story = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
        LoginViewController *loginVC = [story instantiateViewControllerWithIdentifier:@"LoginViewController"];
        
        [self presentViewController:loginVC animated:NO completion:nil];
        
    } else {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSDictionary *userInfo = [userDefaults objectForKey:@"isLogin"];
        _infoView.userName.text = userInfo[@"userName"];
        [_infoView.userHeadIcon setImageForState:(UIControlStateNormal) withURL:[NSURL URLWithString:userInfo[@"headPicture"]] placeholderImage:[UIImage imageNamed:@"app_loading"]];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)loginStatus
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    return [userDefaults objectForKey:@"isLogin"] ;
}

#pragma mark - UITableViewHeader
- (void)setupTableViewHeader
{
    
    self.tableView.autoresizesSubviews = NO;
    _infoView = [[NSBundle mainBundle] loadNibNamed:@"UserCenterInfoView" owner:self options:nil].firstObject;
    [_infoView setFrame:CGRectMake(0, 0, kScreenWidth, 240)];
    
    _infoView.delegate = self;
    [self.tableView addSubview:_infoView];
    self.tableView.contentInset = UIEdgeInsetsMake(220, 0, 0, 0);
}


#pragma mark - UITableViewDataSource,UITableViewDelegate
// 分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _settingArray.count;
}

// 分组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [(NSArray *)_settingArray[section] count];
}

// cell样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserCenterNomalCell *cell = [tableView dequeueReusableCellWithIdentifier:nomalCellIdentifier forIndexPath:indexPath];
    
    NSArray *tempArray = _settingArray[indexPath.section];
    [cell bindUserCenterData:tempArray[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSArray *tempArray = _settingArray[indexPath.section];
    if ([tempArray[indexPath.row][@"ctrlVC"] isEqualToString:@""]) {
        return;
    }
    
    // 跳转控制器
    id ctrlVC = NSClassFromString(tempArray[indexPath.row][@"ctrlVC"]);
    
    [self.navigationController pushViewController:ctrlVC animated:YES];
    
    [self.navigationController popViewControllerAnimated:NO];
    [self.tabBarController setSelectedIndex:2];
    
}

#pragma mark - LoginViewControllerDelegate
- (void)loginViewControllerDidLoginSuccess:(NSDictionary *)userInfo {
    
    if (!userInfo || ![userInfo count]) {
        return ;
    }
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:userInfo forKey:@"isLogin"];
    [userDefaults synchronize];
    
    _infoView.userName.text = userInfo[@"userName"];
    [_infoView.userHeadIcon setImageForState:(UIControlStateNormal) withURL:[NSURL URLWithString:userInfo[@"headPicture"]] placeholderImage:[UIImage imageNamed:@"app_loading"]];
    
}


#pragma mark - UserCenterInfoViewDelegate
- (void)userCenterInfoViewButtonDidClick:(NSUInteger)butonTag {

    switch (butonTag) {
    
        case 300:
        {   // 头像
            DLog(@"点击了头像");
            break;
        }
        case 400:
        {   // 技能
            DownloadSongViewController *dSVC = [[DownloadSongViewController alloc] init];
            [self.navigationController pushViewController:dSVC animated:YES];
            break;
        }
        case 500:
        {   // 需求
            FavoriteAnchorViewController *dSVC = [[FavoriteAnchorViewController alloc] initWithNibName:@"FavoriteAnchorViewController" bundle:nil];
            [self.navigationController pushViewController:dSVC animated:YES];
            break;
        }
        case 600:
        {
            AccountSettingViewController *ctrlVC = [[AccountSettingViewController alloc]initWithNibName:@"AccountSettingViewController" bundle:nil];
            [self.navigationController pushViewController:ctrlVC animated:YES];
            break;
            break;
        }
    }
}

#pragma mark - UIScrollViewDelegate
// 连带滚动方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY<-200) {
        CGRect frame = _infoView.frame;
        frame.origin.y = offsetY;
        frame.size.height = -offsetY;
        _infoView.frame = frame;
    }
}

@end
