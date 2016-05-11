//
//  LoginViewController.m
//  Listening
//
//  Created by Apple on 16/4/17.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "HRMeViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;

@property (weak, nonatomic) IBOutlet UITextField *useerPasswordTF;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (weak, nonatomic) IBOutlet IDRoundButton *registerAction;

@property (weak, nonatomic) IBOutlet IDRoundButton *loginButton;

- (IBAction)loginButton:(IDRoundButton *)sender;

- (IBAction)registerAction:(IDRoundButton *)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.loginButton.enabled = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButton:(IDRoundButton *)sender
{
    [SVProgressHUD showSuccessWithStatus:@"正在登录中……"];
    //直接通过手机号/邮箱来直接登录
    [BmobUser loginInbackgroundWithAccount:_usernameTF.text andPassword:_useerPasswordTF.text block:^(BmobUser *user, NSError *error)
    {
        if(user)
        {
            [SVProgressHUD showSuccessWithStatus:@"登录成功"];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if(!self.isMyVC)
                {
                    [self dismissViewControllerAnimated:YES completion:nil];
                    
                }
                else
                {
                    HRMeViewController * myVC = [HRMeViewController new];
                    
                    [self presentViewController:myVC animated:YES completion:nil];
                    
                    self.Loginblock();
                    
                }
            });
           
        }
        else
        {
            [SVProgressHUD showInfoWithStatus:@"登录失败，请检查网络状态!"];
        }
        
    }];
    
}

- (IBAction)registerAction:(IDRoundButton *)sender
{
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    
    RegisterViewController * reg = [sb instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    
    [self presentViewController:reg animated:YES completion:nil];
}

- (IBAction)usernameTFEditingChange:(UITextField *)sender
{
    [self checkCanLogin];
}

- (IBAction)userpasswordEditingChanged:(UITextField *)sender
{
    [self checkCanLogin];
}

- (IBAction)backAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)firgetAction:(UIButton *)sender
{
    
}

/**检查登录按钮是否可以点击*/
-(void)checkCanLogin
{
    if(self.usernameTF.text.length > 0 && self.useerPasswordTF.text.length > 0)
    {
        self.loginButton.enabled = YES;
    }
    else
    {
        self.loginButton.enabled = NO;
    }
}

@end
