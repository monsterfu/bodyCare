//
//  CheckTemperatureViewController.h
//  bodyCare
//
//  Created by Monster on 14-8-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GlobalHeader.h"


@protocol CheckTemperatureViewControllerDelegate <NSObject>
-(void)CheckTemperatureViewControllerRightButtonTouch;
@end

@interface CheckTemperatureViewController : UIViewController<ConnectionManagerDelegate>
@property(nonatomic,assign)id<CheckTemperatureViewControllerDelegate>delegate;
//panelView
@property (weak, nonatomic) IBOutlet UIView *panelView;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;


@property (weak, nonatomic) IBOutlet UIButton *actionButton;
- (IBAction)actionButtonTouch:(UIButton *)sender;

- (IBAction)rightButtonTouch:(UIButton *)sender;
@end
