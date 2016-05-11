//
//  RankViewModel.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "RankViewModel.h"
#import "HomePageNetManager.h"
#import "RankModel.h"

@interface RankViewModel ()
@property (nonatomic,strong) RankModel *model;
@end

@implementation RankViewModel

- (void)getDataCompletionHandle:(void (^)(NSError *))completed {
    self.dataTask = [HomePageNetManager getRankPageCompletionHandle:^(RankModel* responseObject, NSError *error) {
        self.model = responseObject;
        completed(error);
    }];
}

// 返回分组数
- (NSInteger)sectionNumber {
    return self.model.datas.count;
}

/**  通过分组数返回行数 */
- (NSInteger)rowNumberForSection:(NSInteger)section {
    return self.model.datas[section].list.count;
}
/**  通过分组数返回主标题 */
- (NSString *)mainTitleForSection:(NSInteger)section {
    return self.model.datas[section].title;
}

/**  通过分组和行数, 返回图标URL */
- (NSURL *)coverURLForSection:(NSInteger)section row:(NSInteger)row {
    NSString *path = self.model.datas[section].list[row].coverPath;
    return [NSURL URLWithString:path];
}
/**  通过分组和行数, 返回URL */
- (NSString *)titleForSection:(NSInteger)section row:(NSInteger)row {
    return self.model.datas[section].list[row].title;
}
/**  通过分组和行数, 返回URL */
- (NSString *)firstTitleForSection:(NSInteger)section row:(NSInteger)row {
    return [NSString stringWithFormat:@"1 %@",self.model.datas[section].list[row].firstTitle];
}
/**  通过分组和行数, 返回URL */
- (NSString *)secondTitleForSection:(NSInteger)section row:(NSInteger)row {
    return [NSString stringWithFormat:@"2 %@",self.model.datas[section].list[row].firstKResults[1].title];
}
/**  通过分组和行数, 返回RankKey */
- (NSString *)keyForSection:(NSInteger)section row:(NSInteger)row {
    return self.model.datas[section].list[row].key;
}
/**  通过分组和行数, 返回RankKey */
- (NSString *)contentTypeForSection:(NSInteger)section row:(NSInteger)row {
    return self.model.datas[section].list[row].contentType;
}

- (NSInteger)focusImgNumber {
    return self.model.focusImages.list.count;
}
- (NSURL *)focusImgURLForIndex:(NSInteger)index {
    NSString *path = self.model.focusImages.list[index].pic;
    return [NSURL URLWithString:path];
}

// 改写父类cell高度方法
-(CGFloat)cellHeightForIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
@end
