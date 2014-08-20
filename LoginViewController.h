//
//  LoginViewController.h
//  bodyCare
//
//  Created by 符鑫 on 14-8-21.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
{
    UITapGestureRecognizer* _tapGestureRecognizer;
}


@property (weak, nonatomic) IBOutlet UIButton *jiazhangButton;
@property (weak, nonatomic) IBOutlet UIButton *yishengButton;
- (IBAction)jiazhangButtonTouch:(UIButton *)sender;
- (IBAction)yishengButtonTouch:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@property (weak, nonatomic) IBOutlet UITextField *yanzhengmaTextField;


@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
- (IBAction)loginButtonTouch:(UIButton *)sender;
- (IBAction)registerButtonTouch:(UIButton *)sender;



@end
