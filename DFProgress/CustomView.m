//
//  CustomView.m
//  DFProgress
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 cyfuer. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

+ (Class) layerClass {
    return [CAGradientLayer class];
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor redColor];
        self.layer.cornerRadius = 20;
    }
    return self;
}

- (void)awakeFromNib {
//    self.backgroundColor = [UIColor redColor];
    self.layer.cornerRadius = 20;
}

@end
