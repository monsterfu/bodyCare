//
//  UserInfoEditViewController.m
//  bodyCare
//
//  Created by Monster on 14-8-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "UserInfoEditViewController.h"

@interface UserInfoEditViewController ()

@end

@implementation UserInfoEditViewController

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

- (IBAction)girlButtonTouch:(UIButton *)sender {
}

- (IBAction)boyButtonTouch:(UIButton *)sender {
}

- (IBAction)cameraButtonTouch:(UIButton *)sender {
}

- (IBAction)photoButtonTouch:(UIButton *)sender {
}

- (IBAction)cancelButtonTouch:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneButtonTouch:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
