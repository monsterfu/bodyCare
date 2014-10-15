//
//  UserInfoEditViewController.h
//  bodyCare
//
//  Created by Monster on 14-8-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageCroperViewController.h"
#import "GlobalHeader.h"
#import "AppDelegate.h"

@interface UserInfoEditViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ImageCroperViewControllerDelegate>
{
    UIImagePickerController* _imagePickerController;
    UITapGestureRecognizer* _tapGestureRecognizer;
    
    NSNumber* _sex;
    UIImage* _image;
    NSDate* _birthday;
    NSString* _name;
}
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property(nonatomic,retain)PersonDetailInfo* person;

//性别
@property (weak, nonatomic) IBOutlet UIButton *girlButton;
@property (weak, nonatomic) IBOutlet UIButton *boyButton;
- (IBAction)girlButtonTouch:(UIButton *)sender;
- (IBAction)boyButtonTouch:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthdayLabel;

//头像

@property (weak, nonatomic) IBOutlet UIImageView *headIconImageView;

- (IBAction)cameraButtonTouch:(UIButton *)sender;
- (IBAction)photoButtonTouch:(UIButton *)sender;

- (IBAction)cancelButtonTouch:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)datePicker:(UIDatePicker *)sender;

- (IBAction)doneButtonTouch:(UIButton *)sender;
@end
