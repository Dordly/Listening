//
//  AnchorCell.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnchorView.h"
/**
 *  主播Cell: 三按钮 三label 三小按钮
 */
@interface AnchorCell : UITableViewCell

@property (nonatomic,strong) AnchorView *anchorView0;
@property (nonatomic,strong) AnchorView *anchorView1;
@property (nonatomic,strong) AnchorView *anchorView2;

@end
