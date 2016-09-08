//
//  DFForeView.h
//  DFProgress
//  进度条前置视图
//  Created by apple on 16/8/26.
//  Copyright © 2016年 cyfuer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFForeView : UIView

#pragma mark - 纯色
@property (strong, nonatomic) UIColor *backColor;// 默认为蓝色

#pragma mark - 渐变色
@property (strong, nonatomic) NSArray<UIColor *> *backColors;// 控件内部将自动转成CGColorRef类型
@property (strong, nonatomic) NSArray<NSNumber *> *locations;// 以单位坐标系标定，即0-1之间的值，设置后颜色位置按数组内的值变化，数组长度必须跟foreColors保持一致,可以不设置，


@property (assign, nonatomic) CGPoint startPoint;// 渐变开始位置，以单位坐标系标定
@property (assign, nonatomic) CGPoint endPoint;// 渐变结束位置，startPoint、endPoint一起决定了渐变的方向

@end
