//
//  SpecialMoreViewMoel.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//
#import "SpecialMoreViewMoel.h"
#import "MoreCotentNetManager.h"
#import "SpecialModel.h"

// 时间戳默认*1000  要除回来
#define kBIT 1000
@interface SpecialMoreViewMoel ()
@property (nonatomic,strong) SpecialModel *model;
// 具体天个数
@property (nonatomic,assign) NSInteger dayCount;
// 保存同一天row个数
@property (nonatomic,strong) NSMutableArray *rowArr;
// 记相同数
@property (nonatomic,assign) NSInteger sameNumber;
// 记i增量
@property (nonatomic,assign) NSInteger iNumber;
// 记录加载出来的全部数据(组行数)
@property (nonatomic,strong) NSMutableArray *allDatas;
// 保存时间数组
@property (nonatomic,strong) NSMutableArray *saveDates;
// 保存模型list数组
@property (nonatomic,strong) NSMutableArray *modelArr;
@end

@implementation SpecialMoreViewMoel

#pragma mark - 获取数据方法
- (void)getDataCompletionHandle:(void (^)(NSError *))completed {
    self.dataTask = [MoreCotentNetManager getSpecialForPage:_page completionHandle:^(SpecialModel* responseObject, NSError *error) {
        // 记录模型数组
        [self.modelArr  addObjectsFromArray:responseObject.list];
        // 记录模型
        self.model = responseObject;
        // 各属性初始化
        self.dayCount = 0;
        [self.rowArr removeAllObjects];
        self.sameNumber = 0;
        self.iNumber = 0;
        
        // 获取时间
        [self computationTime];
        completed(error);
    }];
}

- (void)refreshDataCompletionHandle:(void (^)(NSError *))completed {
    // 默认第一次根据page=1加载出来的数据
    _page = 1;
    
    // 清空组行号数组, 日期数组,模型数组
    [_allDatas removeAllObjects];
    [_saveDates removeAllObjects];
    [_modelArr removeAllObjects];
    [self getDataCompletionHandle:completed];
}

- (void)getMoreDataCompletionHandle:(void (^)(NSError *))completed {
    // page+1加载出来的数据作为新值
    _page += 1;
    [self getDataCompletionHandle:completed];
}

#pragma mark - 暴露给外界的接口实现逻辑
// 行数
- (NSInteger)section {
    return self.allDatas.count;
}

/** 通过分组数, 以时间, 获取相应的行数*/
- (NSInteger)rowNumberForSection:(NSInteger)section {
    return [self.allDatas[section] integerValue];
}

- (NSURL *)coverURLForSection:(NSInteger)section row:(NSInteger)row {
    NSString *path  = [self indexForSection:section row:row].coverPathSmall;
    return [NSURL URLWithString:path];
}
- (NSString *)titleForSection:(NSInteger)section row:(NSInteger)row {
    return [self indexForSection:section row:row].title;
}
// 分类ID, 只给 精品听单使用
- (NSUInteger)albumIDForSection:(NSInteger)section index:(NSInteger)index {
    
    return [self indexForSection:section row:index].specialId;
}

// 详情
- (NSString *)trackTitleForSection:(NSInteger)section row:(NSInteger)row {
    return [self indexForSection:section row:row].subtitle;
}
/** 几个声音 */
- (NSString *)footNoteForSection:(NSInteger)section row:(NSInteger)row {
    return [self indexForSection:section row:row].footnote;
}

/** 根据分组获取,组头title */
- (NSString *)mainTitleForSection:(NSInteger)section {
    NSDate *date =  self.saveDates[section];
    NSDateFormatter *matter = [[NSDateFormatter alloc] init];
    [matter setDateFormat:@"YYYY/MM/dd"];
    return [matter stringFromDate:date];
}


/**  根据分组号及行号  获得下标进而返回 一个对象*/
- (SpecialMoreList *)indexForSection:(NSInteger)section row:(NSInteger)row {
    // 累加求值
    NSInteger index = row;  // 记录行号数
    while (section) {
        // 如果组数不为0   则下标=行数+(之前组的所有行数)
        index += [self.allDatas[--section] integerValue];
    }
    return  self.modelArr[index];
}




#pragma mark - 获取时间

/** 以对应的时间分类(分组) 逻辑  -- 时间戳计算时间*/
- (void)computationTime {
    NSArray *arr = self.model.list;
    // 用于记录下标
    NSInteger index = 0;
    for (NSInteger i=0; i<arr.count; i++) {
        // 取出时间,releasedAt因为时间戳多了三位数所以除以1000 宏定义: kBIT 是 1000
        NSDate *oneDate = [NSDate dateWithTimeIntervalSince1970:self.model.list[i].releasedAt/kBIT];
        // 下标不等 (原下标+时间相同个数), 则继续加
       if ( i != index + _iNumber) continue;
        // 记录新下标
        index = i;
        _sameNumber = 0;
        for (NSInteger j=i; j<arr.count; j++) {
            if ([self compareOneDay:oneDate withAnotherDay:[NSDate dateWithTimeIntervalSince1970:self.model.list[j].releasedAt/kBIT]] == 0) {
                // 如果年月日相等 则_sameNumber+1( 一组的行数 )
                _sameNumber +=1;
            }
        }
        // i != 0, 和上一个时间相比, 不同则(分组数)+1
        if ([self compareOneDay:oneDate withAnotherDay:self.saveDates.lastObject]) {
            // rowArr存组对应的行数
            self.rowArr[_dayCount++] = @(_sameNumber);
        } else {
            if (i==0) {
                // 取出最后一个值, 并加上相同个数
                NSInteger number = [self.allDatas.lastObject integerValue] +_sameNumber;
                // 先删除最后一个
                [self.allDatas removeLastObject];
                // 后增加
                [self.allDatas addObject:@(number)];
                // 删除日期最后一个
                [self.saveDates removeLastObject];
            }
        }
        // 记录相同时间个数
        _iNumber = _sameNumber;
        // 保存的日期
        [self.saveDates addObject:oneDate];
        
    }
    // allDatas保存所有组(含行数)数据
    [self.allDatas addObjectsFromArray:[_rowArr copy]];
}

// 比较时间 年月日
- (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending) {
        //NSLog(@"时间1快了");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"时间1慢了");
        return -1;
    }
    //NSLog(@"两个时间相等");
    return 0;
}

#pragma mark - 有数组必懒加载 创建出空间
- (NSMutableArray *)rowArr {
    if (!_rowArr) {
        _rowArr = [NSMutableArray array];
    }
    return _rowArr;
}

- (NSMutableArray *)allDatas {
    if (!_allDatas) {
        _allDatas = [NSMutableArray array];
    }
    return _allDatas;
}
- (NSMutableArray *)saveDates {
    if (!_saveDates) {
        _saveDates = [NSMutableArray array];
    }
    return _saveDates;
}
- (NSMutableArray *)modelArr {
    if (!_modelArr) {
        _modelArr = [NSMutableArray array];
    }
    return _modelArr;
}
@end
