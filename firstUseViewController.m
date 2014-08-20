//
//  firstUseViewController.m
//  bodyCare
//
//  Created by Monster on 14-8-19.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "firstUseViewController.h"

@interface firstUseViewController ()

@end

@implementation firstUseViewController

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
    [_pageControl setNumberOfPages:3];
    _oneViewController = [[firstUseOneViewController alloc]initWithNibName:@"firstUseOneViewController" bundle:nil];
    _twoViewController = [[firstUseTwoViewController alloc]initWithNibName:@"firstUseTwoViewController" bundle:nil];
    [_twoViewController.view setFrame:CGRectMake(DEVICE_WIDTH, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
    _threeViewController = [[firstUseThreeViewController alloc]initWithNibName:@"firstUseThreeViewController" bundle:nil];
    [_threeViewController.view setFrame:CGRectMake(DEVICE_WIDTH*2, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
    _threeViewController.delegate = self;
    
    [_scrollView setContentSize:CGSizeMake(DEVICE_WIDTH*3, DEVICE_HEIGHT)];
    
    [_scrollView addSubview:_oneViewController.view];
    [_scrollView addSubview:_twoViewController.view];
    [_scrollView addSubview:_threeViewController.view];
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
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x == 0) {
        NSLog(@"1");
        [_pageControl setCurrentPage:0];
        [_oneViewController showAnimation];
        
    }else if (scrollView.contentOffset.x == DEVICE_WIDTH) {
        NSLog(@"2");
        [_pageControl setCurrentPage:1];
        [_twoViewController showAnimation];
    }else if (scrollView.contentOffset.x == DEVICE_WIDTH*2) {
        NSLog(@"3");
        [_pageControl setCurrentPage:2];
        [_threeViewController showAnimation];
    }
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView;
{
    NSLog(@"scrollViewDidEndScrollingAnimation");
}
#pragma mark - firstUseThreeViewControllerDelegat
-(void)startButtonTouch
{
    [self performSegueWithIdentifier:@"enterLoginIdentifier" sender:nil];
}
@end
