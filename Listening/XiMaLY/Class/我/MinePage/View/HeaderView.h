//
//  HeaderView.h
//  Listening
//
//  Created by Apple on 16/5/8.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UserIconTapBlock)(UIImageView * userIcon);

@interface HeaderView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *userIconImage;

@property (nonatomic, copy)UserIconTapBlock block;

@end
