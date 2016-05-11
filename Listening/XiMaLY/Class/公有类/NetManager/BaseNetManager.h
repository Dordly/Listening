//
//  BaseNetManager.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kCompletionHandle completionHandle:(void(^)(id model, NSError *error))completionHandle;

@interface BaseNetManager : NSObject
+ (AFHTTPSessionManager *)defaultManager;

//设置网络请求方式--GET
+ (id)GET:(NSString *)path parameters:(NSDictionary *)params complationHandle:(void(^)(id responseObject, NSError *error))completed;
//POST
+ (id)POST:(NSString *)path parameters:(NSDictionary *)params complationHandle:(void(^)(id responseObject, NSError *error))completed;

//字符串
+ (NSString *)percentURLByPath:(NSString *)path params:(NSDictionary *)params;
@end
