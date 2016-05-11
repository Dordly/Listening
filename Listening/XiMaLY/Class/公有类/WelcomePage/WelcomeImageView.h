//
//  WelcomeImageView.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WelcomeImageViewDelegate <NSObject>

@optional
- (void)enterToHomeViewController:(id)sender;

@end

@interface WelcomeImageView : UIView

@property (nonatomic) id<WelcomeImageViewDelegate> delegate;
@property (assign) NSInteger index;

- (void)displayImage:(UIImage *)image;

@end
