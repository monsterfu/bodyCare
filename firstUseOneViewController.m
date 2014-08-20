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
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 1;
    rotationAnimation.cumulative = YES;
    
    rotationAnimation.repeatCount = 1;
    [_label.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    [UIView animateWithDuration:1.2 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        _label.text = [NSString stringWithFormat:@"34.2℃"];
        _label.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.1];
    } completion:^(BOOL finish){
        [UIView animateWithDuration:1.2 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
            _label.text = [NSString stringWithFormat:@"34.8℃"];
            _label.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.3];
        } completion:^(BOOL finish){
            [UIView animateWithDuration:1.2 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
                _label.text = [NSString stringWithFormat:@"35.4℃"];
                _label.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.5];
            } completion:^(BOOL finish){
                [UIView animateWithDuration:1.2 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
                    _label.text = [NSString stringWithFormat:@"36.0℃"];
                    _label.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.7];
                } completion:^(BOOL finish){
                    [UIView animateWithDuration:1.2 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
                        _label.text = [NSString stringWithFormat:@"36.5℃"];
                    } completion:^(BOOL finish){
                        [UIView animateWithDuration:1.2 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
                            _label.text = [NSString stringWithFormat:@"37.1℃"];
                        } completion:^(BOOL finish){
                            [UIView animateWithDuration:1.2 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
                                _label.text = [NSString stringWithFormat:@"38.6℃"];
                            } completion:^(BOOL finish){
                                _label.text = [NSString stringWithFormat:@"34.2℃"];
                            }];
                        }];
                    }];
                }];
            }];
        }];
    }];
}

@end
