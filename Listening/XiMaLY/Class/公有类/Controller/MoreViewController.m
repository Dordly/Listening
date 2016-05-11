//
//  MoreViewController.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
//    WMPageController 设置
    self.menuHeight = 35;
    self.itemsWidths = [self titleWidth];
    self.menuViewStyle = WMMenuViewStyleLine;
    self.progressColor = [UIColor redColor];
}

- (NSArray *)titleWidth {
    NSMutableArray *widthArr = [NSMutableArray new];
    for (NSString *name in self.titles)
    {
        //判断版本号
        if (kIOS7_OR_LATER) {
            // 7.0之后
            CGFloat width = [name boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine attributes:nil context:nil].size.width;
            [widthArr addObject:@(width+40)];
        } else {
            // 7.0之前
            CGFloat width =  [name sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT) lineBreakMode:0].width;
            
        }
        
    }
    
    return [widthArr copy];
}

- (void)back {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
