//
//  UserListViewController.h
//  bodyCare
//
//  Created by Monster on 14-8-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"
#import "TemperatureAndCheckManagerViewController.h"

@interface UserListViewController : UIViewController
{
    NSUInteger _selectedIndex;
    PersonDetailInfo* _selectedPerson;
    NSMutableArray* _buttonArry;
}

@property(nonatomic, retain)NSMutableArray* personArray;

- (IBAction)leftListButtonTouch:(UIBarButtonItem *)sender;
- (IBAction)test1ButtonTouched:(UIButton *)sender;
- (IBAction)test2ButtonTouched:(UIButton *)sender;
- (IBAction)test3ButtonTouched:(UIButton *)sender;
//
@property (weak, nonatomic) IBOutlet UIButton *oneButton;
@property (weak, nonatomic) IBOutlet UIButton *twoButton;
@property (weak, nonatomic) IBOutlet UIButton *threeButton;


//panelImage
@property (weak, nonatomic) IBOutlet UIImageView *panelImage;
- (IBAction)startButtonTouch:(UIButton *)sender;
@end
