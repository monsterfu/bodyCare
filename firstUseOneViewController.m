//
//  firstUseOneViewController.m
//  bodyCare
//
//  Created by Monster on 14-8-19.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "firstUseOneViewController.h"

@interface firstUseOneViewController ()

@end

@implementation firstUseOneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tem = 38.1f;
    _ringImage.transform=CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180.0));
    [self showAnimation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    _label.text = [NSString stringWithFormat:@"34.2℃"];
}

-(void)showAnimation
{
    CABasicAnimation* rotationAnimation1;
    rotationAnimation1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation1.toValue = [NSNumber numberWithFloat: -M_PI];
    rotationAnimation1.duration = 2;
    rotationAnimation1.cumulative = YES;
    rotationAnimation1.removedOnCompletion = NO;
    rotationAnimation1.fillMode = kCAFillModeForwards;
    rotationAnimation1.delegate = self;
    rotationAnimation1.repeatCount = 1;
    [_panelView.layer addAnimation:rotationAnimation1 forKey:@"rotationAnimation"];
    
    _textTImer = [NSTimer timerWithTimeInterval:0.06 target:self selector:@selector(temAni) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:_textTImer forMode:NSRunLoopCommonModes];
}
-(void)temAni
{
    _label.text = [NSString stringWithFormat:@"%.1f℃",_tem];
    _tem += 0.1;
    if (_tem >= 41.5f) {
        _tem = 38.2f;
        [_textTImer invalidate];
    }
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
    }
}
@end
