//
//  firstUseThreeViewController.h
//  bodyCare
//
//  Created by Monster on 14-8-19.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol firstUseThreeViewControllerDelegate <NSObject>
-(void)startButtonTouch;
@end

@interface firstUseThreeViewController : UIViewController

@property(nonatomic,assign)id<firstUseThreeViewControllerDelegate>delegate;


@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)startButtonTouch:(UIButton *)sender;

-(void)showAnimation;
@end
