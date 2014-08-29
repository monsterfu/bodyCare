//
//  SelectedSwitchViewController.h
//  bodyCare
//
//  Created by Monster on 14-8-27.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingViewController.h"
#import "CommonNavigationController.h"

typedef enum : NSUInteger {
    SelectedSwitchEnum_User,
    SelectedSwitchEnum_Setting,
    SelectedSwitchEnum_Max,
}SelectedSwitchEnum;


@interface SelectedSwitchViewController : UIViewController
{
//    UserListViewController* _userListViewController;
    CommonNavigationController* _commonNavigationController;
    SettingViewController* _settingViewController;
    UIStoryboard* _storyBord;
    UIViewController* _currentViewController;
}

-(void)switchToViewEnum:(SelectedSwitchEnum)selectNum;
@end
