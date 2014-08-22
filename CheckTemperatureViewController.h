//
//  CheckTemperatureViewController.h
//  bodyCare
//
//  Created by Monster on 14-8-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CheckTemperatureViewControllerDelegate <NSObject>
-(void)CheckTemperatureViewControllerRightButtonTouch;
@end

@interface CheckTemperatureViewController : UIViewController
@property(nonatomic,assign)id<CheckTemperatureViewControllerDelegate>delegate;


- (IBAction)rightButtonTouch:(UIButton *)sender;
@end
