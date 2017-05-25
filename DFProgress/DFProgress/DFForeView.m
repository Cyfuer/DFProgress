//
//  DFForeView.m
//  DFProgress
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 cyfuer. All rights reserved.
//

#import "DFForeView.h"

@implementation DFForeView

#pragma mark - Initialize

+ (Class)layerClass {
    return [CAGradientLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 3;
    self.startPoint = CGPointMake(0, 0);
    self.endPoint = CGPointMake(1, 0);
    self.backColor = [UIColor blueColor];
}

#pragma mark - Setter
- (void)setBackColor:(UIColor *)backColor {
    
    self.backColors = nil;
    
    self.backgroundColor = backColor;
    _backColor = backColor;
}

- (void)setBackColors:(NSArray *)backColors {
    NSMutableArray *colors;
    if (backColors && backColors.count) {
        
        colors = [NSMutableArray array];
        for (id color in backColors) {
            
            if ([color isKindOfClass:[UIColor class]]) {
                
                UIColor *c = (UIColor *)color;
                [colors addObject:(__bridge id)c.CGColor];
                
            } else {
                
                _backColors = nil;
                return;
                
            }
        }
    }
    
    CAGradientLayer *layer = (CAGradientLayer *)self.layer;
    layer.colors = (NSArray *)colors;
    
    _backColors = (NSArray *)colors;
}

- (void)setLocations:(NSArray *)locations {
    _locations = locations;
    
    CAGradientLayer *layer = (CAGradientLayer *)self.layer;
    layer.locations = _locations;
}

- (void)setStartPoint:(CGPoint)startPoint {
    _startPoint = startPoint;
    
    CAGradientLayer *layer = (CAGradientLayer *)self.layer;
    layer.startPoint = _startPoint;
}

- (void)setEndPoint:(CGPoint)endPoint {
    _endPoint = endPoint;
    
    CAGradientLayer *layer = (CAGradientLayer *)self.layer;
    layer.endPoint = _endPoint;
}


@end
