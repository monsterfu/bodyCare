//
//  firstUseThreeViewController.m
//  bodyCare
//
//  Created by Monster on 14-8-19.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "firstUseThreeViewController.h"

@interface firstUseThreeViewController ()

@end

@implementation firstUseThreeViewController

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
//    [self showAnimation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonTouch:(UIButton *)sender {
    if (self.delegate&&[self.delegate respondsToSelector:@selector(startButtonTouch)]) {
        [self.delegate startButtonTouch];
    }
}

-(void)showAnimation
{
    CAAnimationGroup* animationGroup = [CAAnimationGroup animation];
    
//    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform"];
//    animation1.duration = 1.0;
//    animation1.autoreverses = YES;
//    animation1.repeatCount = NSIntegerMax;
//    animation1.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
//    animation1.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1, 1, 0.1)];
//    [_imageView.layer addAnimation:animation1 forKey:@""];
    
//    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    animation2.duration = 1.0;
//    animation2.autoreverses = YES;
//    animation2.repeatCount = NSIntegerMax;
//    animation2.fromValue = [NSNumber numberWithFloat:1.0];
//    animation2.byValue = [NSNumber numberWithFloat:1.3];
//    animation2.toValue = [NSNumber numberWithFloat:0.8];
//    [_imageView.layer addAnimation:animation2 forKey:@""];
    
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation3.duration = 0.3;
    animation3.autoreverses = YES;
    animation3.repeatCount = 2;
    animation3.fromValue = [NSNumber numberWithFloat:1.0];
    animation3.byValue = [NSNumber numberWithFloat:1.3];
    animation3.toValue = [NSNumber numberWithFloat:1.5];
    [_imageView.layer addAnimation:animation3 forKey:@""];
    
//    animationGroup.animations = [NSArray arrayWithObjects:animation3, animation2, nil];
//    animationGroup.duration = 1;
//    animationGroup.repeatCount = NSIntegerMax;
//    [_imageView.layer addAnimation:animationGroup forKey:@""];
}
@end
