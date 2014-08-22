//
//  TemperatureAndCheckManagerViewController.h
//  bodyCare
//
//  Created by Monster on 14-8-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckTemperatureViewController.h"
#import "RecordLineViewController.h"

@interface TemperatureAndCheckManagerViewController : UIViewController<CheckTemperatureViewControllerDelegate,RecordLineViewControllerDelegate>
{
    CheckTemperatureViewController* _checkViewController;
    RecordLineViewController* _recordViewController;
    
    UIViewController* _currentViewController;
}
@end
