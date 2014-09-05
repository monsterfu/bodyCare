//
//  TemperatureAndCheckManagerViewController.m
//  bodyCare
//
//  Created by Monster on 14-8-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "TemperatureAndCheckManagerViewController.h"

@interface TemperatureAndCheckManagerViewController ()

@end

@implementation TemperatureAndCheckManagerViewController

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
    UIStoryboard* storyBord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _checkViewController = [storyBord instantiateViewControllerWithIdentifier:@"CheckTemperatureIdentifier"];
    _recordViewController = [storyBord instantiateViewControllerWithIdentifier:@"RecordLineViewIdentifier"];
    [self addChildViewController:_checkViewController];
    [self addChildViewController:_recordViewController];
    [self.view addSubview:_checkViewController.view];
    
    _checkViewController.delegate = self;
    _recordViewController.delegate = self;
    _currentViewController = _checkViewController;
    
    [[ConnectionManager sharedInstance]setDelegate:self];
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

#pragma mark - CheckTemperatureViewControllerDelegate
-(void)CheckTemperatureViewControllerRightButtonTouch
{
    [self transitionFromViewController:_currentViewController toViewController:_recordViewController duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
    }completion:^(BOOL finished) {
        if (finished) {
            _currentViewController = _recordViewController;
        }else{
            _currentViewController = _checkViewController;
        }
    }];
}

#pragma mark - RecordLineViewControllerDelegate
-(void)RecordLineViewControllerLeftButtonTouch
{
    [self transitionFromViewController:_currentViewController toViewController:_checkViewController duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
    }completion:^(BOOL finished) {
        if (finished) {
            _currentViewController = _checkViewController;
        }else{
            _currentViewController = _recordViewController;
        }
    }];
}

#pragma mark - 
- (void) isBluetoothEnabled:(bool) enabled
{
    
}
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
    NSLog(@"temp:%.2f",temp);
}
@end
