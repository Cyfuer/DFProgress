//
//  DFProgress.m
//  CustomProgress
//
//  Created by apple on 16/8/22.
//  Copyright © 2016年 cyfuer. All rights reserved.
//

#import "DFProgress.h"
#define Margin_Horizontal 3 // 水平方向进度条与背景之间的间隙
#define Margin_Vertical 3 // 垂直方向进度条与背景之间的间隙

@implementation DFProgress

#pragma mark - Initialize

#pragma mark @ 用代码初始化时通过该方法初始化
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup:frame];
    }
    return self;
}

#pragma mark @ 用Xib初始化时通过该方法初始化
- (void)awakeFromNib {
    [self setup:self.bounds];
}

- (void)setup:(CGRect)frame {
    
    // 设置背景
    self.clipsToBounds = YES;
    _backColor = [UIColor lightGrayColor];
    self.layer.cornerRadius = 5;
    
    // 设置进度条
    _foreView = [[DFForeView alloc] init];
    _foreView.frame = CGRectMake(Margin_Horizontal, Margin_Vertical, 0, frame.size.height - Margin_Vertical * 2);
    [self addSubview:_foreView];
    
    // 设置初始值
    _minValue = 0;
    _maxValue = 1;
    _value = _minValue;
}

#pragma mark - Private
- (CGFloat)getPercent:(CGFloat)value {
    return (value - self.minValue) / (self.maxValue - self.minValue);
}

- (CGFloat)getWidth:(CGFloat)value {
    
    CGFloat percent = [self getPercent:value];
    return (self.bounds.size.width - (Margin_Horizontal * 2))* percent;
}

- (void)animationForForeView:(CGFloat)width {
    
    CGRect rect = self.foreView.frame;
    rect.size.width = width;
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:15 options:UIViewAnimationOptionTransitionNone animations:^{
        
        self.foreView.frame = rect;
    } completion:nil];
}

#pragma mark - Setter
- (void)setBackColor:(UIColor *)backColor {
    _backColor = backColor;
    self.backgroundColor = backColor;
}

- (void)setValue:(CGFloat)value {
    
    // 处理不合法数据
    CGFloat distance = self.maxValue - self.minValue;
    if (distance <= 0) {
        return;
    }
    
    // 赋值
    if (value <= self.minValue) {
        _value = self.minValue;
    } else if (value >= self.maxValue) {
        _value = self.maxValue;
    } else {
        _value = value;
    }
    
    // 动画
    CGFloat width = [self getWidth:_value];
    [self animationForForeView:width];
    
}



@end
