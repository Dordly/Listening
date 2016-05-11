//
//  AccountSettingViewController.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "AccountSettingViewController.h"
#import "UserCenterNomalCell.h"
#import "AccountSettingTableViewCell.h"
#import "PublishFooterView.h"

@interface AccountSettingViewController ()
<
UITableViewDataSource,UITableViewDelegate,
PublishFooterViewDelegate
>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,readwrite,strong) NSArray *settingArray;

@end


static NSString *const nomalCellIdentifier = @"UserCenterNomalCell";
static NSString *const settingCellIdentifier = @"AccountSettingTableViewCell";
@implementation AccountSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = NSLocalizedString(@"账号设置", nil);
    self.settingArray = @[
                          @[
                              @{@"ctrlVC":@"",@"icon":@"",@"title":@"用户名",@"detail":@"修改",@"instr":@""},
                              @{@"ctrlVC":@"",@"icon":@"",@"title":@"常住地址",@"detail":@"西安",@"instr":@""},
                              @{@"ctrlVC":@"",@"icon":@"",@"title":@"性别",@"detail":@"女",@"instr":@""}
                              ],
                          @[
                              @{},
                              @{@"ctrlVC":@"",@"icon":@"",@"title":@"已绑定手机号",@"detail":@"更换",@"instr":@"15730128494"},
                              @{@"ctrlVC":@"",@"icon":@"",@"title":@"登录密码",@"detail":@"修改",@"instr":@"强"},
                              @{@"ctrlVC":@"",@"icon":@"",@"title":@"安保问题",@"detail":@"未设置",@"instr":@""}
                              ],
                          ];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"UserCenterNomalCell" bundle:nil] forCellReuseIdentifier:nomalCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:@"AccountSettingTableViewCell" bundle:nil] forCellReuseIdentifier:settingCellIdentifier];
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark - UITableViewDataSource,UITableViewDelegate
// 分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _settingArray.count;
}

// 分组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {return [(NSArray *)_settingArray[section] count];
}

// cell样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        
        AccountSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:settingCellIdentifier forIndexPath:indexPath];
        return cell;
        
    } else {
    
        UserCenterNomalCell *cell = [tableView dequeueReusableCellWithIdentifier:nomalCellIdentifier forIndexPath:indexPath];
        
        NSArray *tempArray = _settingArray[indexPath.section];
        [cell bindUserCenterData:tempArray[indexPath.row]];
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    if (!section) {
        return nil;
    }
    PublishFooterView *footerView = [[NSBundle mainBundle] loadNibNamed:@"PublishFooterView" owner:self options:nil].lastObject;
    footerView.backgroundColor = [UIColor clearColor];
    footerView.delegate = self;
    [footerView setupFooterViewButtonBackgroundColor:[UIColor whiteColor] borderColor:UIColorFromRGB(0x50B3B9, 1) borderWidth:1.f corner:3.f title:@"退出账号" titleColor:UIColorFromRGB(0x50B3B9, 1)];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
     return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return section ? 60 : 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - PublishFooterViewDelegate
- (void)publishFooterViewDidClickSubmitButton {
    // 底部按钮被点击, 注销
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"您确定要退出吗？"
                                                       delegate:self
                                              cancelButtonTitle:@"取消"
                                              otherButtonTitles:@"确定", nil];
    
    [alertView show];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == alertView.firstOtherButtonIndex)
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
