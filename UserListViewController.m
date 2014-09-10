//
//  UserListViewController.m
//  bodyCare
//
//  Created by Monster on 14-8-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "UserListViewController.h"

@interface UserListViewController ()

@end

@implementation UserListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated
{
    if ([ConnectionManager sharedInstance].status == BodyCare_Status_Ble_Open) {
        [_statusLabel setText:[NSString stringWithFormat:@"蓝牙已打开"]];
    }
    
    [[ConnectionManager sharedInstance]startScanForDevice];
    [[ConnectionManager sharedInstance]setDelegate:self];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    //用户
    _personArray = [PersonDetailInfo allPersonDetail];
    //按钮
    _buttonArry = [NSMutableArray arrayWithObjects:_oneButton,_twoButton,_threeButton, nil];
    _selectedIndex = 0;
    _selectedPerson = [_personArray objectAtIndex:0];
    [self scaleBigButton:_oneButton];
    
    if ([ConnectionManager sharedInstance].status == BodyCare_Status_Ble_Close) {
        [_statusLabel setText:[NSString stringWithFormat:@"蓝牙未打开"]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"TemperatureAndCheckManagerIdentifier"]) {
        TemperatureAndCheckManagerViewController* _temperAndCheckViewController = (TemperatureAndCheckManagerViewController*)[segue destinationViewController];
        _temperAndCheckViewController.person = (PersonDetailInfo*)[_personArray objectAtIndex:_selectedIndex];
    }
}


- (IBAction)leftListButtonTouch:(UIBarButtonItem *)sender {
}

- (IBAction)test1ButtonTouched:(UIButton *)sender {
    if (_selectedIndex != 0) {
        [self scaleSmallButton:[_buttonArry objectAtIndex:_selectedIndex]];
    }
    [self scaleBigButton:sender];
    _selectedIndex = 0;
    
    [self imageAnimationNum:_selectedIndex];
}

- (IBAction)test2ButtonTouched:(UIButton *)sender {
    if (_selectedIndex != 1) {
        [self scaleSmallButton:[_buttonArry objectAtIndex:_selectedIndex]];
    }
    [self scaleBigButton:sender];
    _selectedIndex = 1;
    
    [self imageAnimationNum:_selectedIndex];
}

- (IBAction)test3ButtonTouched:(UIButton *)sender {
    if (_selectedIndex != 2) {
        [self scaleSmallButton:[_buttonArry objectAtIndex:_selectedIndex]];
    }
    [self scaleBigButton:sender];
    _selectedIndex = 2;
    
    [self imageAnimationNum:_selectedIndex];
}

- (IBAction)startButtonTouch:(UIButton *)sender {
    [self performSegueWithIdentifier:@"TemperatureAndCheckManagerIdentifier" sender:nil];
}

#pragma mark - connectmanage
- (void) didDiscoverDevice:(TemperatureFob*)device
{
    [_statusLabel setText:[NSString stringWithFormat:@"已发现设备%@,并尝试进行连接",device.idString]];
}
- (void) didDisconnectWithDevice:(TemperatureFob*)device
{
    [_statusLabel setText:[NSString stringWithFormat:@"与温度计%@断开连接",device.idString]];
}
- (void) didConnectWithDevice:(TemperatureFob*)device
{
    [_statusLabel setText:[NSString stringWithFormat:@"与温度计%@连接成功",device.idString]];
}
- (void) didUpdateTemperature:(CGFloat)temp
{
    
}
#pragma mark - Button Scale
-(void)scaleBigButton:(UIButton*)button
{
    CAKeyframeAnimation *k = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    k.values = @[@(0.1),@(1.0),@(1.5)];
    k.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
    k.calculationMode = kCAAnimationLinear;
    k.fillMode = kCAFillModeForwards;
    k.removedOnCompletion = NO;
    [button.layer addAnimation:k forKey:@"SHOW"];
}

-(void)scaleSmallButton:(UIButton*)button
{
    CAKeyframeAnimation *k = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    k.values = @[@(1.5),@(0.9),@(1.0)];
    k.keyTimes = @[@(1.0),@(0.8),@(0.5),@(0.0)];
    k.calculationMode = kCAAnimationLinear;
    k.fillMode = kCAFillModeForwards;
    k.removedOnCompletion = NO;
    [button.layer addAnimation:k forKey:@"SHOW"];
}
#pragma mark - Animation
-(void)imageAnimationNum:(NSUInteger)num
{
    CABasicAnimation* rotationAnimation1;
    rotationAnimation1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation1.toValue = [NSNumber numberWithFloat: M_PI/2*num];
    rotationAnimation1.duration = 0.5;
    rotationAnimation1.cumulative = YES;
    rotationAnimation1.removedOnCompletion = NO;
    rotationAnimation1.fillMode = kCAFillModeForwards;
    rotationAnimation1.delegate = self;
    rotationAnimation1.repeatCount = 1;
    [_panelImage.layer addAnimation:rotationAnimation1 forKey:@"rotationAnimation"];
}
@end
