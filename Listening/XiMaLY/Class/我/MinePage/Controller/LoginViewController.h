//
//  LoginViewController.h
//  Listening
//
//  Created by Apple on 16/4/17.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LoginViewControllerBlock)();

@interface LoginViewController : UIViewController

@property (nonatomic,assign) BOOL isMyVC;

@property (nonatomic,strong)LoginViewControllerBlock Loginblock;

@end
