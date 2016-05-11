//
//  SoundViewController.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "SoundViewController.h"

@interface SoundViewController ()
@property (nonatomic,strong)UIImageView * imageView;

@end

@implementation SoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, 200, 200)];
    
    self.imageView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2-50);
    
    [self.imageView setImage:[UIImage imageNamed:@"no_history"]];
    
    [self.view addSubview:self.imageView];
}


@end
