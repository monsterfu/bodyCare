//
//  RecordLineViewController.h
//  bodyCare
//
//  Created by Monster on 14-8-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@protocol RecordLineViewControllerDelegate <NSObject>
-(void)RecordLineViewControllerLeftButtonTouch;
@end


@interface RecordLineViewController : UIViewController<BEMSimpleLineGraphDelegate>
@property(nonatomic,assign)id<RecordLineViewControllerDelegate>delegate;

@property (weak, nonatomic) IBOutlet DIDatepicker *datePicker;
@property (weak, nonatomic) IBOutlet BEMSimpleLineGraphView *recordLine;

- (IBAction)rightButtonTouch:(UIButton *)sender;


@property (strong, nonatomic) NSMutableArray *ArrayOfValues;
@property (strong, nonatomic) NSMutableArray *ArrayOfDates;

@end
