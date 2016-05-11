//
//  AnchorCell.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "AnchorCell.h"


#define kAnchorWidth (kWindowW-60)/3
@interface AnchorCell ()
// 关注按钮
@property (nonatomic,strong) UIButton *attractBtn;
@end

@implementation AnchorCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryNone;
        
    }
    return self;
}



- (AnchorView *)anchorView0 {
    if (!_anchorView0) {
        _anchorView0 = [AnchorView new];
        [self.contentView addSubview:_anchorView0];
        [_anchorView0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(kAnchorWidth);

        }];
    }
    return _anchorView0;
}

- (AnchorView *)anchorView1 {
    if (!_anchorView1) {
        _anchorView1 = [AnchorView new];
        [self.contentView addSubview:_anchorView1];
        [_anchorView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(self.anchorView0.mas_right).mas_equalTo(15);
            make.width.mas_equalTo(self.anchorView0);
        }];
    }
    return _anchorView1;
}
- (AnchorView *)anchorView2 {
    if (!_anchorView2) {
        _anchorView2 = [AnchorView new];
        [self.contentView addSubview:_anchorView2];
        [_anchorView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(-15);

            make.width.mas_equalTo(self.anchorView1);
        }];
    }
    return _anchorView2;
}

@end
