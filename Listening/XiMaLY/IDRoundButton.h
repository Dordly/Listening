//
//  IDRoundButton.h
//  侧滑栏效果
//
//  Created by Apple on 16/4/14.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>


//让当前控件可以和StoryBoard 和XIb进行交互(有和两种有交互的能力--可视化的交互)
IB_DESIGNABLE

@interface IDRoundButton : UIButton

/**设置圆角的值*/
/**IBInspectable--让控件在StoryBoard和xib中显示可以调节的属性*/

@property (nonatomic, assign) IBInspectable CGFloat cornerR;

/**设置边框宽度*/
@property (nonatomic, assign)IBInspectable CGFloat lineWidth;

/**设置边框颜色*/
@property (nonatomic, strong)IBInspectable UIColor * lineColor;

@end
