//
//  LoginViewController.m
//  bodyCare
//
//  Created by 符鑫 on 14-8-21.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    _tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:_tapGestureRecognizer];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --
-(void)tap
{
    [_userNameTextField resignFirstResponder];
    [_passWordTextField resignFirstResponder];
    [_yanzhengmaTextField resignFirstResponder];
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

- (IBAction)jiazhangButtonTouch:(UIButton *)sender {
}

- (IBAction)yishengButtonTouch:(UIButton *)sender {
}
- (IBAction)loginButtonTouch:(UIButton *)sender {
}

- (IBAction)registerButtonTouch:(UIButton *)sender {
    [self performSegueWithIdentifier:@"enterRegisterIdentifier" sender:nil];
}

#pragma mark -UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}
@end
