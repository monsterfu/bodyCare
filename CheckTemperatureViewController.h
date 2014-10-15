//
//  CheckTemperatureViewController.h
//  bodyCare
//
//  Created by Monster on 14-8-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GlobalHeader.h"
#import "bottomPanelView.h"

@protocol CheckTemperatureViewControllerDelegate <NSObject>
-(void)CheckTemperatureViewControllerRightButtonTouch;
@end

@interface CheckTemperatureViewController : UIViewController<ConnectionManagerDelegate>
{
    NSMutableArray* _diseaseArray;
}
@property(nonatomic,assign)id<CheckTemperatureViewControllerDelegate>delegate;
//panelView
@property (weak, nonatomic) IBOutlet UIView *panelView;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
//headIcon
@property (weak, nonatomic) IBOutlet UIImageView *headIconImageView;
//
@property(nonatomic,retain)PersonDetailInfo* person;

@property (weak, nonatomic) IBOutlet UIButton *actionButton;
- (IBAction)actionButtonTouch:(UIButton *)sender;

- (IBAction)rightButtonTouch:(UIButton *)sender;

//症状
@property (weak, nonatomic) IBOutlet bottomPanelView *bottomView;
- (IBAction)bottonButtonTouch:(UIButton *)sender;
- (IBAction)bottomButtonTouchDragInside:(UIButton *)sender;

//


@end
