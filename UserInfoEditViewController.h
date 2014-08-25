//
//  UserInfoEditViewController.h
//  bodyCare
//
//  Created by Monster on 14-8-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoEditViewController : UIViewController



@property (weak, nonatomic) IBOutlet UIButton *girlButton;
@property (weak, nonatomic) IBOutlet UIButton *boyButton;
- (IBAction)girlButtonTouch:(UIButton *)sender;
- (IBAction)boyButtonTouch:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *birthdayLabel;


- (IBAction)cameraButtonTouch:(UIButton *)sender;
- (IBAction)photoButtonTouch:(UIButton *)sender;

- (IBAction)cancelButtonTouch:(UIButton *)sender;



- (IBAction)doneButtonTouch:(UIButton *)sender;
@end
