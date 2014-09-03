//
//  RegisterViewController.h
//  bodyCare
//
//  Created by 符鑫 on 14-8-21.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
{
    UITapGestureRecognizer* _tapGestureRecognizer;
}
@property (weak, nonatomic) IBOutlet UIButton *jzButton;
@property (weak, nonatomic) IBOutlet UIButton *ysButton;
- (IBAction)jzButtonTouch:(UIButton *)sender;
- (IBAction)ysButtonTouch:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;

- (IBAction)registerButtonTouch:(UIButton *)sender;

@end
