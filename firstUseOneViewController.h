//
//  firstUseOneViewController.h
//  bodyCare
//
//  Created by Monster on 14-8-19.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@interface firstUseOneViewController : UIViewController
{
    float _tem;
    NSTimer* _textTImer;
}
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIView *panelView;
@property (weak, nonatomic) IBOutlet UIImageView *ringImage;
-(void)showAnimation;
@end
