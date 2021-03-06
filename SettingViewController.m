//
//  SettingViewController.m
//  bodyCare
//
//  Created by Monster on 14-8-25.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _settingArray = [NSArray arrayWithObjects:@"报警短信接收",@"报警声音选择",@"闪光灯频率",@"密码修改",nil];
    _tableView.SKSTableViewDelegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_settingArray count];
}

- (NSInteger)tableView:(SKSTableView *)tableView numberOfSubRowsAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            return 0;
        }
            break;
            
        case 1:
        {
            return 3;
        }
            break;
            
        case 2:
        {
            return 3;
        }
            break;
            
        case 3:
        {
            return 1;
        }
            break;
        default:
            return 0;
            break;
    }
}
- (UITableViewCell *)tableView:(SKSTableView *)tableView cellForSubRowAtIndexPath:(NSIndexPath *)indexPath
{
    _settingCell =[tableView dequeueReusableCellWithIdentifier:@"settingCellIdentifier"];
    return _settingCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForSubRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 58.0f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SKSTableViewCell* settingCell = [tableView dequeueReusableCellWithIdentifier:@"settingCellIdentifier"];
    
    settingCell.textLabel.text = [_settingArray objectAtIndex:indexPath.row];
    settingCell.selectionStyle = UITableViewCellSelectionStyleGray;
    switch (indexPath.row) {
        case 0:
        {
            settingCell.isExpandable = NO;
        }
            break;
            
        case 1:
        {
            settingCell.isExpandable = YES;
        }
            break;
            
        case 2:
        {
            settingCell.isExpandable = YES;
        }
            break;
            
        case 3:
        {
            settingCell.isExpandable = YES;
        }
            break;
        default:
            settingCell.isExpandable = NO;
            break;
    }
    return settingCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        if (![_tableView isExpandedForCellAtIndexPath:indexPath]) {
//            [self performSegueWithIdentifier:WIRELESSALARMACTION sender:nil];
        }
    }
    
}
@end
