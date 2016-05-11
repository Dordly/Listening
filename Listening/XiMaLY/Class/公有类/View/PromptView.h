//
//  PromptView.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PromptType) {
    PromptTypeNoNetwork,  // 网络请求失败
    PromptTypeNoneData,   // no data from service
    PromptTypeErrorData,  // error from service
    PromptTypeOther,
};

@interface PromptView : UIView


+ (PromptView *)promptViewShowInSuperView:(UIView *)view promptType:(PromptType)type dataSource:(id)dataSource actionBlock:(void (^)())block;

+ (PromptView *)promptViewShowInSuperView:(UIView *)view icon:(UIImage *)img title:(NSString *)title detail:(NSString *)detail buttonTitle:(NSString *)btnTitle dataSource:(id)dataSource actionBlock:(void (^)())block;

@end
