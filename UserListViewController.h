//
//  UserListViewController.h
//  bodyCare
//
//  Created by Monster on 14-8-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@interface UserListViewController : UIViewController


@property(nonatomic, retain)NSMutableArray* personArray;

- (IBAction)leftListButtonTouch:(UIBarButtonItem *)sender;
- (IBAction)test1ButtonTouched:(UIButton *)sender;
- (IBAction)test2ButtonTouched:(UIButton *)sender;
- (IBAction)test3ButtonTouched:(UIButton *)sender;

@end
