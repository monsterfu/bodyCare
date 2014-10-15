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
#import "CircleView.h"
#import "DragImageView.h"

@interface UserListViewController : UIViewController<ConnectionManagerDelegate, DragImageViewDelegate>
{
    NSUInteger _selectedIndex;
    PersonDetailInfo* _selectedPerson;
    NSMutableArray* _buttonArry;
    NSNumber* _rotationNumber;
    
    UserInfoEditViewController* _userInfoEditViewController;
    
    //test
    DragImageView *imageviewOne;
    DragImageView *imageviewTwo;
    DragImageView *imageviewThree;
    DragImageView *imageviewAddNew;
    
    NSMutableArray *arrImage;
    
    CGPoint pointCenter;
    CGFloat fRadius;//半径
    CGFloat fAvarage_Radina;//平均角度
    CGPoint pointDrag;
    NSInteger iCurrentIndex;
    NSInteger iStep;
}

@property(nonatomic, retain)NSMutableArray* personArray;
//

//panelImage
@property (weak, nonatomic) IBOutlet UIImageView *panelImage;
- (IBAction)startButtonTouch:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

//label
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end
