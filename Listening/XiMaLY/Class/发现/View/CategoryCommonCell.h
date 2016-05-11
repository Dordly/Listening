//
//  CategoryCommonCell.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryButton.h"

@protocol CategoryCommonCellDelegate <NSObject>

- (void)categoryCommonCellsubButtonDidClick:(NSInteger)index;

@end

@interface CategoryCommonCell : UITableViewCell

@property (nonatomic,readwrite,assign) NSInteger index;
@property (nonatomic,strong) CategoryButton *btn1;
@property (nonatomic,strong) CategoryButton *btn2;
@property (nonatomic,readwrite,weak) id<CategoryCommonCellDelegate> delegate;

@end
