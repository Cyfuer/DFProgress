//
//  DFProgress.h
//  CustomProgress
//
//  Created by apple on 16/8/22.
//  Copyright © 2016年 cyfuer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFForeView.h"

@interface DFProgress : UIView

@property (strong, nonatomic) DFForeView *foreView;// 前置视图,通过该对象修改前置视图的相关参数，详细参数见DFForeView.h


@property (strong, nonatomic) UIColor *backColor;// 背景色，默认LightGrayColor

@property (assign, nonatomic) CGFloat minValue;// 默认0
@property (assign, nonatomic) CGFloat maxValue;// 默认1

@property (assign, nonatomic) CGFloat value;// 取值如果小于最小值，自动转换为最小值，最大值同理

@end
