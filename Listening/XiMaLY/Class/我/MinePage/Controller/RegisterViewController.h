//
//  RegisterViewController.h
//  Listening
//
//  Created by Apple on 16/4/17.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RegisterResult)(NSString * userName);

@interface RegisterViewController : UIViewController

/**注册成功后的回调方法*/

@property (nonatomic,copy)RegisterResult resBlock;

@end
