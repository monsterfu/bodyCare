//
//  GlobalHeader.h
//  bodyCare
//
//  Created by Monster on 14-8-19.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#ifndef bodyCare_GlobalHeader_h
#define bodyCare_GlobalHeader_h

#import <CoreBluetooth/CoreBluetooth.h>
#import "NSDate+JBCommon.h"
#import "NSString+randonStr.h"
#import "BEMSimpleLineGraphView.h"
#import "RESideMenu.h"
#import "DIDatepicker/DIDatepicker.h"

#define VISION_NO    @"1.1.2"
//#define NSLog(...) {}
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7 ?YES:NO)
#define DEVICE_WIDTH  [UIScreen mainScreen].bounds.size.width
#define DEVICE_HEIGHT  [UIScreen mainScreen].bounds.size.height
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#define APP_BACKGROUND_COLOR  [UIColor colorWithRed:0 green:222/255.0 blue:111/255.0 alpha:1.0]

//弧度、角度转换
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))


//
#define BASE @"http://182.92.109.3:8080/EaseHome/door"
#define TAG_LOGIN   10001

//注册登录
#define KEY_USERNAME @"KEY_USERNAME"
#define KEY_PASSWORD @"KEY_PASSWORD"


#define KEY_HEADICON_STR    @"key_headicon_str"
#define KEY_NICKNAME_STR    @"key_nickname_str"
#define KEY_BLOOD_STR       @"key_blood_str"
#define KEY_SEX_STR         @"key_sex_str"
#define KEY_HIGH_STR        @"key_high_str"
#define KEY_HEIGHT_STR      @"key_height_str"
#define KEY_BIRTH_STR       @"key_birth_str"
#define KEY_PERSONDETAIL_SELECT_STR     @"key_persondetail_select_str"

#define KEY_FOBNAME       @"key_fobname"
#define KEY_PERSONID       @"key_personid"
#define KEY_FOBUUID         @"key_fobuuid"

#define KEY_SELECED_FOB        @"key_selected_fob"
#define KEY_BACKGROUND_OPEN     @"key_background_open"
//setting

#define KEY_GAPTIMER_STR   @"key_gaptimer_str"   //时间间隔
#define KEY_LOWEST_STR     @"key_lowest_str"     //最低温度
#define KEY_MOST_STR       @"key_most_str"       //最高温度

#define KEY_WARNING_OPEN   @"key_warning_open"   //报警开关
#define KEY_BACKGROUND_OPEN @"key_background_open"  //后台开关

#endif
