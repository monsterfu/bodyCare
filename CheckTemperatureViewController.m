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
    _diseaseArray = @[@"流鼻涕",@"大量出汗",@"咳嗽",@"发冷"];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    [[ConnectionManager sharedInstance]setDelegate:self];
    
    _panelView.transform=CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180.0 - 45.0));
    _tempLabel.text = @"0.0℃";
    
    [_headIconImageView.layer setCornerRadius:CGRectGetHeight([_headIconImageView bounds]) / 2];
    _headIconImageView.layer.masksToBounds = YES;
}
-(void)setPerson:(PersonDetailInfo *)person
{
    _person = person;
    [_headIconImageView setImage:_person.image];
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

- (IBAction)bottonButtonTouch:(UIButton *)sender {
    NSLog(@"bottonButtonTouch");
    if (sender.selected) {
        sender.selected = NO;
        [UIView animateWithDuration:0.3 animations:^{
            [_bottomView setFrame:CGRectMake(0, DEVICE_HEIGHT- 30, _bottomView.frame.size.width, _bottomView.frame.size.height)];
        }];
    }else{
        sender.selected = YES;
        [UIView animateWithDuration:0.3 animations:^{
            [_bottomView setFrame:CGRectMake(0, DEVICE_HEIGHT- 138, _bottomView.frame.size.width, _bottomView.frame.size.height)];
        }];
    }
}

- (IBAction)bottomButtonTouchDragInside:(UIButton *)sender {
    NSLog(@"bottomButtonTouchDragInside sender pos: x %f  y  %f", sender.frame.origin.x,sender.frame.origin.y);
}
@end
