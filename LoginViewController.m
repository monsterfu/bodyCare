//
//  LoginViewController.m
//  bodyCare
//
//  Created by 符鑫 on 14-8-21.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "LoginViewController.h"

#import "UserListViewController.h"
#import "LeftViewController.h"

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
    
    if ([USER_DEFAULT objectForKey:KEY_USERNAME]) {
        _userNameTextField.text = [USER_DEFAULT objectForKey:KEY_USERNAME];
    }else{
        [_userNameTextField becomeFirstResponder];
    }
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"enterMainYRSideViewIdentifier"]) {
        _sideViewController = [segue destinationViewController];
        UIStoryboard* storyBord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        _selectedSwitchViewController = [storyBord instantiateViewControllerWithIdentifier:@"SelectedSwitchViewID"];
        _leftViewController = [storyBord instantiateViewControllerWithIdentifier:@"LeftViewID"];
        _leftViewController.delegate = self;
        _sideViewController.rootViewController=_selectedSwitchViewController;
        _sideViewController.leftViewController=_leftViewController;
        _sideViewController.rightViewController=nil;
        _sideViewController.leftViewShowWidth=180;
        _sideViewController.needSwipeShowMenu=true;//默认开启的可滑动展示
    }
}


- (IBAction)jiazhangButtonTouch:(UIButton *)sender {
    [_jiazhangButton setSelected:YES];
    [_yishengButton setSelected:NO];
}

- (IBAction)yishengButtonTouch:(UIButton *)sender {
    [_yishengButton setSelected:YES];
    [_jiazhangButton setSelected:NO];
}

- (BOOL)isMobileNumber:(NSString *)mobileNum
{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


- (IBAction)loginButtonTouch:(UIButton *)sender {
    NSLog(@"loginTouched");
    
    NSString* telephoneNum = [_userNameTextField.text stringByReplacingOccurrencesOfString:@"-" withString:@""];
    if (![self isMobileNumber:telephoneNum]) {
        UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"请输入正确的手机号码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    [_userNameTextField resignFirstResponder];
    
    [USER_DEFAULT removeObjectForKey:KEY_USERNAME];
    [USER_DEFAULT setObject:_userNameTextField.text forKey:KEY_USERNAME];
    [USER_DEFAULT synchronize];
    
    [self performSegueWithIdentifier:@"enterMainYRSideViewIdentifier" sender:nil];
//    [HttpRequest fetchHostRequest:telephoneNum seqno:[NSString randomStr] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:)];
//    
//    [ProgressHUD show:@"获取主机信息中,请稍候"];
}

- (IBAction)registerButtonTouch:(UIButton *)sender {
    [self performSegueWithIdentifier:@"enterRegisterIdentifier" sender:nil];
}

#pragma mark -UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == _userNameTextField) {
        NSString *validRegEx =@"^[0-9]*$";
        NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
        BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
        if (myStringMatchesRegEx)
        {
            if (range.location == 3 || range.location == 8) {
                if (![string isEqualToString:@""]) {
                    textField.text = [NSString stringWithFormat:@"%@-",textField.text];
                }
            }
            
            if (range.location >= 13) {
                return NO;
            }
            return YES;
        }
        else
            return NO;
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _userNameTextField) {
        if (textField.text.length != 13) {
            UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"输入的手机号位数不对" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            [alertView show];
            return NO;
        }
        return YES;
    }
    return YES;
}
#pragma mark - leftViewControllerDelegate
-(void)leftViewControllerListSelectedAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath:%d,%d",indexPath.row,indexPath.subRow);
    if (indexPath.row < 4&&indexPath.row) {
        [_selectedSwitchViewController switchToViewEnum:SelectedSwitchEnum_User];
        [_sideViewController hideSideViewController:YES];
    }
    if (indexPath.row == 4) {
        [_selectedSwitchViewController switchToViewEnum:SelectedSwitchEnum_Setting];
        [_sideViewController hideSideViewController:YES];
    }
}
@end
