//
//  UserCenterInfoView.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "UserCenterInfoView.h"

@interface UserCenterInfoView ()

@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UIImageView *middleImageView;
@property (weak, nonatomic) IBOutlet UILabel *middleLabel;
//设置
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

@property (weak, nonatomic) IBOutlet UIView *bottomContentView;
@end

@implementation UserCenterInfoView

- (void)awakeFromNib {

    self.bottomContentView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    [self.bgImageView setImage:[self coreBlurImage:[UIImage imageNamed:@"usercenter_background"] withBlurNumber:1]];
    self.userHeadIcon.layer.borderWidth = 3.f;
    self.userHeadIcon.layer.borderColor = [UIColor whiteColor].CGColor;
    self.userHeadIcon.layer.cornerRadius = 40.f;
    self.userHeadIcon.clipsToBounds = YES;
    
}

- (IBAction)clickAlbumButton:(UIButton *)sender
{
    
    if ([self.delegate respondsToSelector:@selector(userCenterInfoViewButtonDidClick:)]) {
        [self.delegate userCenterInfoViewButtonDidClick:sender.tag];
    }
}

- (IBAction)handleSomethingDidClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(userCenterInfoViewButtonDidClick:)]) {
        [self.delegate userCenterInfoViewButtonDidClick:sender.tag];
    }
    
}

- (UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage= [CIImage imageWithCGImage:image.CGImage];
    //设置filter
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey]; [filter setValue:@(blur) forKey: @"inputRadius"];
    //模糊图片
    CIImage *result=[filter valueForKey:kCIOutputImageKey];
    CGImageRef outImage=[context createCGImage:result fromRect:[result extent]];
    UIImage *blurImage=[UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    return blurImage;
}

@end
