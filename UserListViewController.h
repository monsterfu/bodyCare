//
//  UserListViewController.h
//  bodyCare
//
//  Created by Monster on 14-8-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"
#import "UserInfoEditViewController.h"
#import "TemperatureAndCheckManagerViewController.h"

@interface UserListViewController : UIViewController<ConnectionManagerDelegate>
{
    NSUInteger _selectedIndex;
    PersonDetailInfo* _selectedPerson;
    NSMutableArray* _buttonArry;
    NSNumber* _rotationNumber;
    
    UserInfoEditViewController* _userInfoEditViewController;
}

@property(nonatomic, retain)NSMutableArray* personArray;

- (IBAction)leftListButtonTouch:(UIBarButtonItem *)sender;
- (IBAction)test1ButtonTouched:(UIButton *)sender;
- (IBAction)test2ButtonTouched:(UIButton *)sender;
- (IBAction)test3ButtonTouched:(UIButton *)sender;
- (IBAction)newButtonTouched:(UIButton *)sender;

//



//
@property (weak, nonatomic) IBOutlet UIButton *oneButton;
@property (weak, nonatomic) IBOutlet UIButton *twoButton;
@property (weak, nonatomic) IBOutlet UIButton *threeButton;


//panelImage
@property (weak, nonatomic) IBOutlet UIImageView *panelImage;
- (IBAction)startButtonTouch:(UIButton *)sender;

//label
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end
