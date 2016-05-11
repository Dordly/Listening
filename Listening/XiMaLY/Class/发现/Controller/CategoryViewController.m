//
//  CategoryViewController.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "CategoryViewController.h"
#import "CategoryViewModel.h"
#import "CategorySpecialCell.h"
#import "CategoryCommonCell.h"
#import "JumpViewController.h"

@interface CategoryViewController ()
<
UITableViewDataSource,UITableViewDelegate,
CategoryCommonCellDelegate,CategorySpecialCellDelegate
>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) CategoryViewModel *categoryVM;

// 记录0行cell高度
@property (nonatomic,assign) CGFloat zeroCellHight;
@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MBProgressHUD showMessage:@"正在努力为您加载..."];
    [self.categoryVM getDataCompletionHandle:^(NSError *error) {
        [MBProgressHUD hideHUD];
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.categoryVM.listsCount >5 ? (self.categoryVM.listsCount - 5)/6+1 : 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section ? 3 : 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CategorySpecialCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SCell"];
        // 取Cell的高度
        cell.delegate = self;
        self.zeroCellHight = cell.cellHeight;
        [cell.icon0 setImageForState:(UIControlStateNormal) withURL:[self.categoryVM coverURLForIndex:0] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_6"]];
        [cell.icon1 setImageForState:(UIControlStateNormal) withURL:[self.categoryVM coverURLForIndex:1] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_6"]];
        [cell.icon2 setImageForState:(UIControlStateNormal) withURL:[self.categoryVM coverURLForIndex:2] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_6"]];
        [cell.icon3 setImageForState:(UIControlStateNormal) withURL:[self.categoryVM coverURLForIndex:3] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_6"]];
        [cell.icon4 setImageForState:(UIControlStateNormal) withURL:[self.categoryVM coverURLForIndex:4] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_6"]];
        
        return cell;

    } else {
        CategoryCommonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CCell"];
        cell.delegate = self;
        // 三排两列排布规律
        NSInteger index = indexPath.section * 6 + indexPath.row * 2;
        cell.index = index;
        [cell.btn1.icon setImageWithURL:[self.categoryVM coverURLForIndex:(index - 1)] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
        [cell.btn2.icon setImageWithURL:[self.categoryVM coverURLForIndex:index] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
        cell.btn1.categoryLb.text = [self.categoryVM titleForIndex:(index -1 )];
        cell.btn2.categoryLb.text = [self.categoryVM titleForIndex:index];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section ? 44 : self.zeroCellHight;

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section ? 5 : 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma mark - CustomMethod

- (void)gotoNextController:(NSInteger)index {
    
    NSInteger _categoryId = [self.categoryVM IDForIndex:index];
    NSString *_type = [self.categoryVM contentTypeForIndex:index];
    NSString *title = [self.categoryVM titleForIndex:index];
    
    JumpViewController *vc = [[JumpViewController alloc] initWithCategoryId:_categoryId contentType:_type tag:index title:title];
    
    
    // push 跳转控制器 隐藏tabbar
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:NO];
}


#pragma mark - CategoryCommonCellDelegate
- (void)categoryCommonCellsubButtonDidClick:(NSInteger)index
{
//    NSLog(@"%@被点击.",[self.categoryVM titleForIndex:index]);
    
    [self gotoNextController:index];
}

#pragma mark - CategorySpecialCellDelegate
- (void)categorySpecialCellCurrentButton:(NSInteger)index {
    
    [self gotoNextController:index];
}


#pragma mark - 懒加载
- (CategoryViewModel *)categoryVM {
    if (!_categoryVM) {
        _categoryVM = [CategoryViewModel new];
    }
    return _categoryVM;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            // 防止头部空出一块(因为无头视图)
            make.top.mas_equalTo(-35);
            make.bottom.left.right.mas_equalTo(0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[CategorySpecialCell class] forCellReuseIdentifier:@"SCell"];
        [_tableView registerClass:[CategoryCommonCell class] forCellReuseIdentifier:@"CCell"];
        // 禁止超出上下拉
        _tableView.bounces = NO;
    }
    return _tableView;
}
@end
