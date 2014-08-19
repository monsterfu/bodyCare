//
//  firstUseTwoViewController.h
//  bodyCare
//
//  Created by Monster on 14-8-19.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@interface firstUseTwoViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *ArrayOfValues;
@property (strong, nonatomic) NSMutableArray *ArrayOfDates;

@property (weak, nonatomic) IBOutlet BEMSimpleLineGraphView *lineGraphView;
- (void)refresh;
@end
