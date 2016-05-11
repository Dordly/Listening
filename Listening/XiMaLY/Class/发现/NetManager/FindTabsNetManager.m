//
//  FindTabsNetManager.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "FindTabsNetManager.h"
#import "FindTabsModel.h"

#define kMenuURL @"http://mobile.ximalaya.com/mobile/discovery/v1/tabs?device=ios"
@implementation FindTabsNetManager

+ (id)getFindTabsCompletionHandle:(void (^)(id, NSError *))completed {
    return [self GET:kMenuURL parameters:nil complationHandle:^(NSDictionary* responseObject, NSError *error) {
           
        completed([FindTabsModel mj_objectWithKeyValues:responseObject],error);
    }];
}
@end
