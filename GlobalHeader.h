//
//  GlobalHeader.h
//  bodyCare
//
//  Created by Monster on 14-8-19.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#ifndef bodyCare_GlobalHeader_h
#define bodyCare_GlobalHeader_h

#import "BEMSimpleLineGraphView.h"
#import "RESideMenu.h"


#define VISION_NO    @"1.1.2"
//#define NSLog(...) {}
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7 ?YES:NO)
#define DEVICE_WIDTH  [UIScreen mainScreen].bounds.size.width
#define DEVICE_HEIGHT  [UIScreen mainScreen].bounds.size.height
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#define APP_BACKGROUND_COLOR  [UIColor colorWithRed:0 green:222/255.0 blue:111/255.0 alpha:1.0]


#endif
