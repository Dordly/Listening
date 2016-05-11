//
//  HRMeViewController.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "HRMeViewController.h"
#import "LoginViewController.h"
#import "SettingViewController.h"
#import "TapeViewController.h"

@interface HRMeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *userLabel;

@property (weak, nonatomic) IBOutlet UIButton *userIcon;

@end

@implementation HRMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.bounces = NO;

    self.tableView.showsVerticalScrollIndicator = NO;
    
    self.navigationItem.backBarButtonItem.title = @"返回";
    
    [self changeUserInfo:nil];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        UIView *view = [[UIView alloc]init];
        //录音
        UIButton *recordedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [view addSubview:recordedBtn];
        [recordedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
            make.width.mas_equalTo(250);
            make.height.mas_equalTo(40);
        }];
        [recordedBtn setImage:[UIImage imageNamed:@"btn_record_n"] forState:UIControlStateNormal];
        [recordedBtn setImage:[UIImage imageNamed:@"btn_record_h"] forState:UIControlStateHighlighted];
        
        [recordedBtn addTarget:self action:@selector(recordedOnclick:) forControlEvents: UIControlEventTouchUpInside];
        return view;
    } else {
        return nil;
    }
    
}

-(void)recordedOnclick:(UIButton *)sender
{
    NSLog(@"要录音了，要录音了");
    UIStoryboard * story = [UIStoryboard storyboardWithName:@"TapeViewController" bundle:nil];
    
    TapeViewController * tape = [story instantiateViewControllerWithIdentifier:@"TapeViewController"];
    
    [self presentViewController:tape animated:YES completion:nil];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section ? 10:60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (IBAction)loginAction:(UIButton *)sender
{
        //如果用户已登录，就进入个人中心页面
        if([BmobUser getCurrentUser])
        {
            //模拟退出登录状态
            [BmobUser logout];
    
            [[NSNotificationCenter defaultCenter] postNotificationName:KEY_USER_LOGIN_CHANGED object:nil];
            
        }
    else
    {
        //如果用户未登录，就进入登录界面
        UIStoryboard * SB = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    
        LoginViewController * login = [SB instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self presentViewController:login animated:YES completion:nil];
    }
}

-(void)changeUserInfo:(NSNotification *)notice
{
    //获取当前的登录对象(登录后，BmobUser会在本地存储一下登录用户的信息--持久化存储)
    BmobUser  * currentUser = [BmobUser getCurrentUser];
    
    //判断是否登录
    if(currentUser)
    {
        self.userLabel.text = currentUser.username;
        
    }
    else
    {
        self.userLabel.text = @"点击图片登录";
    }
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
