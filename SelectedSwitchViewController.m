//
//  SelectedSwitchViewController.m
//  bodyCare
//
//  Created by Monster on 14-8-27.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "SelectedSwitchViewController.h"

@interface SelectedSwitchViewController ()

@end

@implementation SelectedSwitchViewController

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
    
    _storyBord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _commonNavigationController = [_storyBord instantiateViewControllerWithIdentifier:@"UserListNavigationIdentifier"];
    _settingViewController = [_storyBord instantiateViewControllerWithIdentifier:@"SettingViewID"];
    _recordLineViewController = [_storyBord instantiateViewControllerWithIdentifier:@"RecordLineViewIdentifier"];
    
    
    [self addChildViewController:_commonNavigationController];
    [self addChildViewController:_settingViewController];
    [self addChildViewController:_recordLineViewController];
    [self.view addSubview:_commonNavigationController.view];
    
    _currentViewController = _commonNavigationController;
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
-(void)switchToViewEnum:(SelectedSwitchEnum)selectNum
{
    switch (selectNum) {
        case SelectedSwitchEnum_Main:
        {
            [_commonNavigationController popToRootViewControllerAnimated:YES];
            if (_currentViewController != _commonNavigationController) {
                [self transitionFromViewController:_currentViewController toViewController:_commonNavigationController duration:1.0f options:UIViewAnimationOptionTransitionNone animations:nil completion:^(BOOL finish){
                    if (finish) {
                        _currentViewController = _commonNavigationController;
                    }
                }];
            }
        }
            break;
        case SelectedSwitchEnum_User:
        {
            if (_currentViewController != _recordLineViewController) {
                [self transitionFromViewController:_currentViewController toViewController:_recordLineViewController duration:1.0f options:UIViewAnimationOptionTransitionNone animations:nil completion:^(BOOL finish){
                    if (finish) {
                        _currentViewController = _recordLineViewController;
                    }
                }];
            }
        }
            break;
        case SelectedSwitchEnum_Setting:
        {
            if (_currentViewController != _settingViewController) {
                [self transitionFromViewController:_currentViewController toViewController:_settingViewController duration:1.0f options:UIViewAnimationOptionTransitionNone animations:nil completion:^(BOOL finish){
                    if (finish) {
                        _currentViewController = _settingViewController;
                    }
                }];
            }
        }
            break;
        default:
            break;
    }
}
@end
