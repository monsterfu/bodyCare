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
#import "RecordLineViewController.h"

typedef enum : NSUInteger {
    SelectedSwitchEnum_Main, //测量等界面
    SelectedSwitchEnum_User, //用户体温记录等界面
    SelectedSwitchEnum_Setting, //设置
    SelectedSwitchEnum_Max,
}SelectedSwitchEnum;


@interface SelectedSwitchViewController : UIViewController
{
//    UserListViewController* _userListViewController;
    CommonNavigationController* _commonNavigationController;
    SettingViewController* _settingViewController;
    RecordLineViewController* _recordLineViewController;
    UIStoryboard* _storyBord;
    UIViewController* _currentViewController;
}

-(void)switchToViewEnum:(SelectedSwitchEnum)selectNum;
@end
