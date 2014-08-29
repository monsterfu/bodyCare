//
//  LeftViewController.h
//  bodyCare
//
//  Created by Monster on 14-8-25.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKSTableViewCell.h"
#import "sksTableview/SKSTableView.h"
#import "userLIstCell.h"
#import "GlobalHeader.h"

@protocol LeftViewControllerDelegate <NSObject>

-(void)leftViewControllerListSelectedAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface LeftViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,SKSTableViewDelegate>
{
    NSArray* _settingArray;
    SKSTableViewCell* _settingCell;
    userLIstCell* _userListCell;
}
@property (nonatomic, assign)id<LeftViewControllerDelegate>delegate;
@property (weak, nonatomic) IBOutlet SKSTableView *tableView;
@property (weak, nonatomic) IBOutlet SKSTableViewCell *cell;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;


@end
