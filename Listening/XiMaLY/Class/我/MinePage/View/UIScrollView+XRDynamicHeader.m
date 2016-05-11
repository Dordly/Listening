//
//  UIScrollView+XRDynamicHeader.m
//  Day050601头像上传
//
//  Created by Apple on 16/5/6.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "UIScrollView+XRDynamicHeader.h"

static NSString * const keyContentOffset = @"contentOffset";

@interface DynamicHeaderImageView()
{
    //设置初始高度
    CGFloat _orginHeight;
    
    HeaderView * _headerView;
}

@end

@implementation DynamicHeaderImageView

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self= [super initWithFrame:frame])
    {
        self.userInteractionEnabled = YES;
        //记录初始高度
        _orginHeight = CGRectGetHeight(frame);
        
        HeaderView * header = [[NSBundle mainBundle]loadNibNamed:@"HeaderView" owner:self options:nil].firstObject;
        
        header.frame = self.bounds;
        
        [self addSubview:header];
        
        header.block = ^(UIImageView * userIcon)
        {
          if(self.block)
          {
              self.block(userIcon);
          }
        };
        
        _headerView = header;
    }
    return self;
}

-(void)setScrollView:(UIScrollView *)scrollView
{
    _scrollView = scrollView;
    
    //在这儿可以去观察ScrollView的变化
    [_scrollView addObserver:self forKeyPath:keyContentOffset options:NSKeyValueObservingOptionNew context:nil];
}
/**
 *  观察的KVO的回调
 *
 *  @param keyPath 观察的key
 *  @param object  被观察的对象
 *  @param change  key所对应的值得变化
 *  @param context 标识
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    //1.处理数据的地方
    
    //手动调用LayoutSubViews
//    [self layoutSubviews];
    //注册成为需要更新布局--也就是在下一个消息循环的时候调用LayoutSubViews
    [self setNeedsLayout];
    
    //调用drowRect方法-重绘
//    [self setNeedsDisplay];
    
}
//处理视图
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat offSetY = _scrollView.contentOffset.y;
//    NSLog(@"offSetY = %f",offSetY);
    
    if(offSetY < -_orginHeight)
    {
        //取差值
        CGFloat moveY = fabs(offSetY +_orginHeight);
        // NSLog(@"%lf",moveY);
        
        CGFloat x = - moveY;
        CGFloat y = -_orginHeight -moveY;
        CGFloat w = CGRectGetWidth(_scrollView.frame) + moveY*2;
        CGFloat h = _orginHeight + moveY;
        
        self.frame = CGRectMake(x, y, w, h);
        
        //头像的旋转
        CGFloat angle = moveY / _orginHeight * M_PI*2;
        
        CATransform3D transform1 = CATransform3DMakeRotation(angle, 0, 0, 1);
        
        //sin -1 - 1
        CATransform3D transform2 = CATransform3DMakeScale(1 + moveY/_orginHeight, 1+moveY/_orginHeight, 1);
        
        //组合变换
        _headerView.userIconImage.layer.transform = CATransform3DConcat(transform1, transform2);
//        _headerView.UsericonImage.layer.transform = transform1;
        
    }else{
        
        CGFloat x = 0;
        CGFloat y = -_orginHeight;
        CGFloat w = CGRectGetWidth(_scrollView.frame);
        CGFloat h = _orginHeight;
        
        self.frame = CGRectMake(x, y, w, h);
        
        _headerView.userIconImage.layer.transform = CATransform3DIdentity;
    }
    //2.通过change来改变
    //    CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
}

-(void)removeFromSuperview
{
    //移除观察者
    [super removeFromSuperview];
    
    [_scrollView removeObserver:self forKeyPath:keyContentOffset];
}
-(void)dealloc
{
    [_scrollView removeObserver:self forKeyPath:keyContentOffset];
}

@end

@implementation UIScrollView (XRDynamicHeader)

-(void)addDynamicHeaderWithImageName:(NSString *)imageName
                              Height:(CGFloat)height
                    UserIconTapBlock:(UserIconTapBlock)block
{
    DynamicHeaderImageView * bgImageView = [[DynamicHeaderImageView alloc]initWithFrame:CGRectMake(0, -height, CGRectGetWidth(self.frame), height)];
    
    bgImageView.scrollView = self;
    
    bgImageView.block = block;
    
    bgImageView.image = [UIImage imageNamed:imageName];
    
    [self addSubview:bgImageView];
    
    //让ScrollView的内边距距离上部高度
    self.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
}

@end
