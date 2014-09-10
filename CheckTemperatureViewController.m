//
//  CheckTemperatureViewController.m
//  bodyCare
//
//  Created by Monster on 14-8-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "CheckTemperatureViewController.h"

@interface CheckTemperatureViewController ()

@end

@implementation CheckTemperatureViewController

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
    // Do any additional setup after loading the view.
    
    [[ConnectionManager sharedInstance]setDelegate:self];
    
    _panelView.transform=CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180.0));
    _tempLabel.text = @"0.0℃";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)actionButtonTouch:(UIButton *)sender {
}

- (IBAction)rightButtonTouch:(UIButton *)sender {
    if (self.delegate&&[self.delegate respondsToSelector:@selector(CheckTemperatureViewControllerRightButtonTouch)]) {
        [self.delegate CheckTemperatureViewControllerRightButtonTouch];
    }
}

#pragma mark - connectionManager Delegate
- (void) didDiscoverDevice:(TemperatureFob*)device
{
    
}
- (void) didDisconnectWithDevice:(TemperatureFob*)device
{
    
}
- (void) didConnectWithDevice:(TemperatureFob*)device
{
    
}
- (void) didUpdateTemperature:(CGFloat)temp
{
    _tempLabel.text = [NSString stringWithFormat:@"%.2f℃",temp];
}
#pragma mark - ronati
-(void)rotationAnimation
{
    CABasicAnimation* rotationAnimation1;
    rotationAnimation1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation1.toValue = [NSNumber numberWithFloat: M_PI];
    rotationAnimation1.duration = 2;
    rotationAnimation1.cumulative = YES;
    rotationAnimation1.removedOnCompletion = NO;
    rotationAnimation1.fillMode = kCAFillModeForwards;
    [_panelView.layer addAnimation:rotationAnimation1 forKey:@"rotationAnimation"];
}

@end
