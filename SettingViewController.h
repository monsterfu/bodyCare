//
//  SettingViewController.h
//  bodyCare
//
//  Created by Monster on 14-8-25.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKSTableViewCell.h"
#import "sksTableview/SKSTableView.h"
#import "GlobalHeader.h"

@interface SettingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,SKSTableViewDelegate>
{
    NSArray* _settingArray;
    SKSTableViewCell* _settingCell;
}

@property (weak, nonatomic) IBOutlet SKSTableView *tableView;
@property (weak, nonatomic) IBOutlet SKSTableViewCell *cell;

@end
