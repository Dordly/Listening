//
//  RegisterViewController.m
//  Listening
//
//  Created by Apple on 16/4/17.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

//用户名--手机号
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;

//验证码
@property (weak, nonatomic) IBOutlet UITextField *testTextField;

- (IBAction)resigisterAction:(IDRoundButton *)sender;

//密码
@property (weak, nonatomic) IBOutlet UITextField *userpasswordYF;

//获取验证码
@property (weak, nonatomic) IBOutlet IDRoundButton *textButton;

//注册按钮
@property (weak, nonatomic) IBOutlet IDRoundButton *registerButton;

@end

@implementation RegisterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
//注册按钮
- (IBAction)resigisterAction:(IDRoundButton *)sender
{
    BmobUser *user = [[BmobUser alloc]init];
    user.mobilePhoneNumber = _usernameTF.text;
    user.password = _userpasswordYF.text;
    [user signUpOrLoginInbackgroundWithSMSCode:_testTextField.text block:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
            [SVProgressHUD showSuccessWithStatus:@"注册成功,可以登录了哦!"];
            [self dismissViewControllerAnimated:YES completion:nil];
        }else{
            [SVProgressHUD showErrorWithStatus:@"注册失败啦，要重新登录耶!"];
            NSLog(@"error = %@",[error localizedDescription]);
        }
    }];
}

//手机号
- (IBAction)userNameChange:(UITextField *)sender
{
    [self checkInput];
}

//验证码
- (IBAction)verifyChange:(UITextField *)sender
{
    [self checkInput];
}
//密码长度
- (IBAction)userpasswordChangr:(UITextField *)sender
{
    [self checkInput];
}
//返回上一层
- (IBAction)backAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//点击获取验证码
- (IBAction)verifyAction:(UIButton *)sender
{
    [BmobSMS requestSMSCodeInBackgroundWithPhoneNumber:_usernameTF.text andTemplate:@"test" resultBlock:^(int number, NSError *error) {
        if (error) {
            [SVProgressHUD showErrorWithStatus:@"短信发送失败..."];
        }else{
            [SVProgressHUD showSuccessWithStatus:@"短息已发送，请注意查收"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{});
        }
    }];
}

//手机号验证
-(BOOL)validateWithMobile:(NSString *)mobile
{
    //手机号一般以13，18，15开头
    NSString * phone = @"^((13[0-9])|(17[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phone];
    return [phoneTest evaluateWithObject:mobile];
}

//检查是否输入
- (void)checkInput {
    BOOL isSucssesful = [self validateWithMobile:_usernameTF.text];
    if (isSucssesful && self.userpasswordYF.text.length > 0 && self.testTextField.text > 0) {
        self.registerButton.enabled = YES;
        
        self.registerButton.alpha = 1;
        
    }else
    {
        self.registerButton.enabled = NO;
        self.registerButton. alpha = 0.5;
    }
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [BmobUser logout];
}
@end
