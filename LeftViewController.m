//
//  LeftViewController.m
//  bodyCare
//
//  Created by Monster on 14-8-25.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

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
    _mainTitleStr = @"bodyCare体温检测";
    _settingArray = [NSArray arrayWithObjects:_mainTitleStr,@"宝贝列表",@"设置",nil];
    _tableView.SKSTableViewDelegate = self;
    
    UIView* _views = [UIView new];
    [_views setBackgroundColor:[UIColor clearColor]];
    [_tableView setTableFooterView:_views];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(mainActionChange) name:NSNotificationMainActionChange object:nil];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:NSNotificationMainActionChange object:nil];
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

#pragma mark - Notification
-(void)mainActionChange
{
    
}
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
            return 0;
        }
            break;
//
//        case 3:
//        {
//            return 1;
//        }
//            break;
        default:
            return 0;
            break;
    }
}
- (UITableViewCell *)tableView:(SKSTableView *)tableView cellForSubRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (1){//indexPath.row == 0) {
        _userListCell = [tableView dequeueReusableCellWithIdentifier:@"userLIstCellIdentifier" forIndexPath:indexPath];
        _userListCell.headImage = nil;
        _userListCell.backgroundColor = [UIColor clearColor];
        return _userListCell;
    }
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
            settingCell.isExpandable = NO;
        }
            break;
//
//        case 3:
//        {
//            settingCell.isExpandable = YES;
//        }
//            break;
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
    if (self.delegate&&[self.delegate respondsToSelector:@selector(leftViewControllerListSelectedAtIndexPath:)]) {
        [self.delegate leftViewControllerListSelectedAtIndexPath:indexPath];
    }
    
}
@end
