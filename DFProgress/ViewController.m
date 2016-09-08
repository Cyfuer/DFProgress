//
//  ViewController.m
//  DFProgress
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 cyfuer. All rights reserved.
//

#import "ViewController.h"
#import "DFProgress.h"
#import "CustomView.h"
#import "DFForeView.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutletCollection(DFProgress) NSArray *progressArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (DFProgress *progress in self.progressArr) {
        
        [self setup:progress];
    }
}

- (void)setup:(DFProgress *)progress {
    
    NSInteger index = arc4random() % 4;
    
    progress.minValue = 10;
    progress.maxValue = 100;
    
    if (index == 0) {
        progress.foreView.backColor = randomColor();
        
    } else if (index == 1) {
        progress.foreView.backColors = @[randomColor(),randomColor()];
        
    } else if (index == 2) {
        progress.foreView.backColors = @[randomColor(),randomColor(),randomColor()];

    } else if (index == 3) {
        progress.foreView.backColors = @[randomColor(),randomColor(),randomColor(),randomColor()];
        
    }
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(updateValue:) userInfo:progress repeats:YES];
    
}

- (void)updateValue:(NSTimer *)timer {
    DFProgress *progress = (DFProgress *)[timer userInfo];
    int a = arc4random() % (int)progress.maxValue;
    int value =  a + (int)progress.minValue;
    progress.value = value;
}

UIColor* randomColor() {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
