//
//  firstUseViewController.h
//  bodyCare
//
//  Created by Monster on 14-8-19.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "firstUseOneViewController.h"
#import "firstUseTwoViewController.h"
#import "firstUseThreeViewController.h"

@interface firstUseViewController : UIViewController<UIScrollViewDelegate,firstUseThreeViewControllerDelegate>
{
    firstUseOneViewController* _oneViewController;
    firstUseTwoViewController* _twoViewController;
    firstUseThreeViewController* _threeViewController;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end
