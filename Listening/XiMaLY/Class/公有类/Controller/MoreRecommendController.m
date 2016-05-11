//
//  MoreRecommendController.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "MoreRecommendController.h"
#import "MoreContentViewModel.h"
#import "MoreCategoryCell.h"
#import "TitleView.h"
#import "iCarousel.h"
#import "FocusImageScrollView.h"
#import "DestinationViewController.h"
#import "RankListViewController.h"
#import "SpecialCell.h"
#import "SpecialSongViewController.h"

@interface MoreRecommendController ()<UITableViewDataSource,UITableViewDelegate,iCarouselDataSource,iCarouselDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) MoreContentViewModel *moreVM;
@end

@implementation MoreRecommendController
{
    UIPageControl *_pageControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 接受上层控制器传过来的VM
    self.moreVM = self.keyArr[2];
    self.tableView.hidden = NO;
}

#pragma mark - iCarousel代理方法
// @require
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.moreVM.focusImgNumber;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view {
    UIImageView *imgView = nil;
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/660*310)];
        imgView = [UIImageView new];
        [view addSubview:imgView];
        imgView.tag = 100;
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        view.clipsToBounds = YES;
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    
    imgView = (UIImageView *)[view viewWithTag:100];
    [imgView setImageWithURL:[self.moreVM focusImgURLForIndex:index] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_2"]];
    return view;
}

// @option
/** 允许循环滚动 */
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value {
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

/**  监控滚到第几个 */
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
    _pageControl.currentPage = carousel.currentItemIndex;
}



#pragma mark - UITableView协议方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.moreVM.sectionNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.moreVM rowForSection:section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:@"Cell"];
        if (!cell) {
            // Cell格式制作
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
            [cell.imageView setImageWithURL:[self.moreVM coverURLForIndexPath:indexPath] placeholderImage:[UIImage imageNamed:@"find_albumcell_cover_bg"]];
            cell.textLabel.text = [self.moreVM titleForIndexPath:indexPath];
            cell.detailTextLabel.text = [self.moreVM subTitleForIndexPath:indexPath];
            cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
            cell.detailTextLabel.textColor = [UIColor lightGrayColor];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        return cell;
    } else if ([self.moreVM moduleTypeForSection:indexPath.section] == 4){
        
        SpecialCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SCell"];
                [cell.coverBtn setImageForState:UIControlStateNormal withURL:[self.moreVM coverURLForIndexPath:indexPath] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_2"]];
                cell.titleLb.text = [self.moreVM titleForIndexPath:indexPath];
                cell.subTitleLb.text = [self.moreVM subTitleForIndexPath:indexPath];
                cell.footNoteLb.text = [self.moreVM contentTypeForIndexPath:indexPath];
        return cell;
        
    } else {
        MoreCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MCell"];
        [cell.coverBtn setImageForState:UIControlStateNormal withURL:[self.moreVM coverURLForIndexPath:indexPath] placeholderImage:[UIImage imageNamed:@"find_albumcell_cover_bg"]];
        cell.titleLb.text = [self.moreVM titleForIndexPath:indexPath];
        cell.introLb.text = [self.moreVM subTitleForIndexPath:indexPath];
        cell.playsLb.text = [self.moreVM playsForIndexPath:indexPath];
        cell.tracksLb.text = [self.moreVM tracksForIndexPath:indexPath];
        return cell;
    }
}
// 制作表头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return !section ? nil : [[TitleView alloc] initWithTitle:[self.moreVM mainTitleForSection:section] hasMore:[self.moreVM hasMoreForSection:section]];
}

// 组头高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return !section ? 0: 35;
}
// 组尾高
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section) {
        
        if ([self.moreVM moduleTypeForSection:indexPath.section] == 4) {
            // shouldHighlightRowAtIndexPath:  这个代理过滤只能点击第一组
            SpecialSongViewController *ctrlVC = [[SpecialSongViewController alloc] initWithNibName:@"SpecialSongViewController" bundle:nil];
            ctrlVC.specialId = [self.moreVM albumIdForIndexPath:indexPath];
            ctrlVC.specialTitle = [self.moreVM titleForIndexPath:indexPath];
            [self.navigationController pushViewController:ctrlVC animated:YES];
        } else {
            // 从本控制器VM获取头标题, 以及分类ID回初始化
            DestinationViewController *vc = [[DestinationViewController alloc] initWithAlbumId:[self.moreVM albumIdForIndexPath:indexPath] title:[self.moreVM titleForIndexPath:indexPath]];
            // 隐藏状态栏及底部栏
            vc.hidesBottomBarWhenPushed = YES;
            self.navigationController.navigationBar.hidden = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    } else {
    
        RankListViewController *rankVC = [[RankListViewController alloc] initWithTitle:[self.moreVM titleForIndexPath:indexPath] type:[self.moreVM contentTypeForIndexPath:indexPath] rankingListKey:[self.moreVM keyForIndexPath:indexPath]];
        [self.navigationController pushViewController:rankVC animated:YES];
    }
    
}

#pragma mark - VM,tableView懒加载
// VM 和传入值相等

- (UITableView *)tableView {
    if (!_tableView) {
        // 分组模式
        _tableView= [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[MoreCategoryCell class] forCellReuseIdentifier:@"MCell"];
        [_tableView registerClass:[SpecialCell class] forCellReuseIdentifier:@"SCell"];
        _tableView.rowHeight = 70;
        
        // 去分隔线
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        // 封装好的头部滚动视图
        FocusImageScrollView *scrollView = [[FocusImageScrollView alloc] initWithFocusImgNumber:self.moreVM.focusImgNumber];
        scrollView.ic.delegate = self;
        scrollView.ic.dataSource = self;
        _pageControl = scrollView.pageControl;
        _tableView.tableHeaderView = scrollView;
    }
    return _tableView;
}

@end
