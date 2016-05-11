//
//  AnchorViewModel.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "AnchorViewModel.h"
#import "HomePageNetManager.h"
#import "AnchorModel.h"

@interface AnchorViewModel ()
@property (nonatomic,strong) AnchorModel *model;
@end

@implementation AnchorViewModel

- (void)getDataCompletionHandle:(void (^)(NSError *))completed {
    self.dataTask = [HomePageNetManager getAnchorPageCompletionHandle:^(AnchorModel* responseObject, NSError *error) {
        self.model = responseObject;
        
        completed(error);
    }];
}

- (NSInteger)section {
    return self.model.list.count;
}
// 主播cover图片
- (NSURL *)coverURLForSection:(NSInteger)section Index:(NSInteger)index {
    NSString *path = self.model.list[section].list[index].smallLogo;
    return [NSURL URLWithString:path];
}
// 主播Name
- (NSString *)nameForSection:(NSInteger)section Index:(NSInteger)index {
    return self.model.list[section].list[index].nickname;
}

- (NSString *)mainTitleForSection:(NSInteger)section {
    return self.model.list[section].title;
}
/** 给TitleView的组ID-----更多都为1*/
- (NSInteger)mainIDForSection:(NSInteger)section {
    return self.model.list[section].ID;
}
/** 给TitleView的组name-----更多都为1*/
- (NSString *)mainNameForSection:(NSInteger)section {
    return self.model.list[section].name;
}


/**  获取主播uid */
- (NSUInteger)anthorUidForSection:(NSInteger)section Index:(NSInteger)index {
    
    return self.model.list[section].list[index].uid;;
}


/** 通过indexPath返回cell高*/
- (CGFloat)cellHeightForIndexPath:(NSIndexPath *)indexPath {
    return 170;
}

@end
