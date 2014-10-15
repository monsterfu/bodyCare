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

#define imageWH  (120)

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
    [self initDragImageView];
    [self showImage];
    
    [self.view bringSubviewToFront:_panelImage];
    [self.view bringSubviewToFront:_startButton];
    
    _selectedIndex = 0;
    _selectedPerson = [_personArray objectAtIndex:0];
    
    if ([ConnectionManager sharedInstance].status == BodyCare_Status_Ble_Close) {
        [_statusLabel setText:[NSString stringWithFormat:@"蓝牙未打开"]];
    }
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(userInfoChange) name:NSNotificationCenter_personInfoChange object:nil];
    
}

-(void)userInfoChange
{
    _personArray = [PersonDetailInfo allPersonDetail];
    
    imageviewOne.person = [_personArray objectAtIndex:0];
    imageviewTwo.person = [_personArray objectAtIndex:1];
    imageviewThree.person = [_personArray objectAtIndex:2];
}

- (void)initDragImageView{
    imageviewOne = [[DragImageView alloc] initWithFrame:CGRectMake(0, 0, imageWH, imageWH)];
    imageviewOne.bgImageView.image = [UIImage imageNamed:@"1yezi-xiao-hong.png"];
    imageviewOne.person = [_personArray objectAtIndex:0];
    imageviewOne.delegate = self;
    imageviewTwo = [[DragImageView alloc] initWithFrame:CGRectMake(0, 0, imageWH, imageWH)];
    imageviewTwo.bgImageView.image = [UIImage imageNamed:@"1yezi-xiao-huang.png"];
    imageviewTwo.person = [_personArray objectAtIndex:1];
    imageviewTwo.delegate = self;
    imageviewThree = [[DragImageView alloc] initWithFrame:CGRectMake(0, 0, imageWH, imageWH)];
    imageviewThree.bgImageView.image = [UIImage imageNamed:@"1yezi-xiao-lan.png"];
    imageviewThree.person = [_personArray objectAtIndex:2];
    imageviewThree.delegate = self;
    imageviewAddNew = [[DragImageView alloc] initWithFrame:CGRectMake(0, 0, imageWH, imageWH)];
    imageviewAddNew.bgImageView.image = [UIImage imageNamed:@"1yezi-xiao-lv.png"];
    imageviewAddNew.delegate = self;
    arrImage = [[NSMutableArray alloc] initWithObjects:imageviewOne, imageviewTwo, imageviewThree, imageviewAddNew, nil];
}

//显示方式是确定圆心正下方的点，然后逆时针绘制点
- (void)showImage{
    CircleView *circleView = [[CircleView alloc] initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH , DEVICE_WIDTH)];
    circleView.arrImages = arrImage;
    [self.view addSubview:circleView];
    [circleView loadView];
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
    }else if([segue.identifier isEqualToString:@"userInfoDetailModelIdentifier"]) {
        _userInfoEditViewController = (UserInfoEditViewController*)[segue destinationViewController];
        _userInfoEditViewController.person = (PersonDetailInfo*)sender;
    }
}


- (IBAction)leftListButtonTouch:(UIBarButtonItem *)sender {
}

- (IBAction)test1ButtonTouched:(UIButton *)sender {
    if (_selectedIndex != 0) {
        [self scaleSmallButton:[_buttonArry objectAtIndex:_selectedIndex]];
        [self scaleBigButton:sender];
        _selectedIndex = 0;
    }else{
        [self performSegueWithIdentifier:@"userInfoDetailModelIdentifier" sender:[_personArray objectAtIndex:_selectedIndex]];
    }
    
    [self imageAnimationNum:_selectedIndex];
}

- (IBAction)test2ButtonTouched:(UIButton *)sender {
    if (_selectedIndex != 1) {
        [self scaleSmallButton:[_buttonArry objectAtIndex:_selectedIndex]];
        [self scaleBigButton:sender];
        _selectedIndex = 1;
    }else{
        [self performSegueWithIdentifier:@"userInfoDetailModelIdentifier" sender:[_personArray objectAtIndex:_selectedIndex]];
    }
    
    
    [self imageAnimationNum:_selectedIndex];
}

- (IBAction)test3ButtonTouched:(UIButton *)sender {
    if (_selectedIndex != 2) {
        [self scaleSmallButton:[_buttonArry objectAtIndex:_selectedIndex]];
        [self scaleBigButton:sender];
        _selectedIndex = 2;
    }else{
        [self performSegueWithIdentifier:@"userInfoDetailModelIdentifier" sender:[_personArray objectAtIndex:_selectedIndex]];
    }
    
    
    [self imageAnimationNum:_selectedIndex];
}

- (IBAction)newButtonTouched:(UIButton *)sender {
    [self performSegueWithIdentifier:@"userInfoDetailModelIdentifier" sender:nil];
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
    k.values = @[@(1.1),@(1.0),@(1.5)];
    k.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
    k.calculationMode = kCAAnimationCubicPaced;
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
    rotationAnimation1.fromValue = _rotationNumber;
    rotationAnimation1.toValue = [NSNumber numberWithFloat: M_PI/2*num];
    _rotationNumber = [NSNumber numberWithFloat: M_PI/2*num];
    rotationAnimation1.duration = 0.5;
    rotationAnimation1.cumulative = YES;
    rotationAnimation1.fillMode = kCAFillModeForwards;
    rotationAnimation1.removedOnCompletion = NO;
    rotationAnimation1.delegate = self;
    rotationAnimation1.repeatCount = 1;
    [_panelImage.layer addAnimation:rotationAnimation1 forKey:@"rotationAnimation"];
}


#pragma mark -
#pragma mark - DrapImageViewDelegate
-(void)DragImageViewLongTap:(PersonDetailInfo*)person
{
    [self performSegueWithIdentifier:@"userInfoDetailModelIdentifier" sender:person];
}
@end
