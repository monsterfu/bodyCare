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
    
    [_headIconImageView.layer setCornerRadius:CGRectGetHeight([_headIconImageView bounds]) / 2];
    _headIconImageView.layer.masksToBounds = YES;
    
    
    NSLocale *cnTime = [[NSLocale alloc]initWithLocaleIdentifier:[[USER_DEFAULT objectForKey:@"AppleLanguages"]objectAtIndex:0]];
    NSString* dateStr = [[[NSDate date] descriptionWithLocale:cnTime]substringToIndex:10];
    _birthdayLabel.text = dateStr;
    if (_person != nil) {
        NSString* dateStr = [[_person.birthday descriptionWithLocale:cnTime]substringToIndex:10];
        _birthdayLabel.text = dateStr;
        _nameLabel.text = _person.name;
        [self setPersonSex:[_person.sex boolValue]];
        _headIconImageView.image = _person.image;
        [_datePicker setDate:_person.birthday animated:YES];
        
        _sex = _person.sex;
        _birthday = [_person birthday];
        _name = [_person name];
        _image = [_person image];
    }
    
    _tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [self.view addGestureRecognizer:_tapGestureRecognizer];
    
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

-(void)tapAction
{
}
#pragma mark -setSex

-(void)setPersonSex:(BOOL)sex
{
    if (sex) {
        [_boyButton setSelected:YES];
        [_girlButton setSelected:NO];
    }else{
        [_boyButton setSelected:NO];
        [_girlButton setSelected:YES];
    }
}
#pragma mark -photo about

- (void)showImagePickerForSourceType:(UIImagePickerControllerSourceType)sourceType
{
    //    if (self.imageView.isAnimating)
    //    {
    //        [self.imageView stopAnimating];
    //    }
    //
    //    if (self.capturedImages.count > 0)
    //    {
    //        [self.capturedImages removeAllObjects];
    //    }
    
    _imagePickerController = [[UIImagePickerController alloc] init];
    _imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    _imagePickerController.sourceType = sourceType;
    _imagePickerController.delegate = self;
    
    if (sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        /*
         The user wants to use the camera interface. Set up our custom overlay view for the camera.
         */
        _imagePickerController.showsCameraControls = YES;
        
        /*
         Load the overlay view from the OverlayView nib file. Self is the File's Owner for the nib file, so the overlayView outlet is set to the main view in the nib. Pass that view to the image picker controller to use as its overlay view, and set self's reference to the view to nil.
         */
        //        [[NSBundle mainBundle] loadNibNamed:@"OverlayView" owner:self options:nil];
        //        self.overlayView.frame = imagePickerController.cameraOverlayView.frame;
        //        imagePickerController.cameraOverlayView = self.overlayView;
        //        self.overlayView = nil;
    }
    
    //    self.imagePickerController = imagePickerController;
    [self presentViewController:_imagePickerController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    NSLog(@"didFinishPickingImage");
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"didFinishPickingMediaWithInfo");
    UIImage* images;
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera)
	{
		images = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
		UIImageWriteToSavedPhotosAlbum(images, self,
									   nil,
									   nil);
	}
	//获得编辑过的图片
    images = [info objectForKey: @"UIImagePickerControllerOriginalImage"];
	
    
    ImageCroperViewController* _imageCroperViewController = [[ImageCroperViewController alloc]initWithNibName:@"ImageCroperViewController" bundle:nil];
    _imageCroperViewController.delegate = self;
    _imageCroperViewController.editImage = images;
    [self dismissViewControllerAnimated:YES completion:^{
        [self presentViewController:_imageCroperViewController animated:YES completion:nil];
    }];
    
    
	
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"imagePickerControllerDidCancel");
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - delegate
-(void)useEditImage:(UIImage*)image
{
//    [_headButton setImage:image forState:UIControlStateNormal];
//    [_headButton setImage:image forState:UIControlStateHighlighted];
    [_headIconImageView setImage:image];
    _image = image;
}

- (IBAction)girlButtonTouch:(UIButton *)sender {
    if (sender.selected == NO) {
        _girlButton.selected = YES;
        _boyButton.selected = NO;
        _sex = [NSNumber numberWithInt:0];
    }
    
}

- (IBAction)boyButtonTouch:(UIButton *)sender {
    if (sender.selected == NO) {
        _boyButton.selected = YES;
        _girlButton.selected = NO;
        _sex = [NSNumber numberWithInt:1];
    }
}

- (IBAction)cameraButtonTouch:(UIButton *)sender {
    [self showImagePickerForSourceType:UIImagePickerControllerSourceTypeCamera];
}

- (IBAction)photoButtonTouch:(UIButton *)sender {
    [self showImagePickerForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
}

- (IBAction)cancelButtonTouch:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)datePicker:(UIDatePicker *)sender {
    NSLocale *cnTime = [[NSLocale alloc]initWithLocaleIdentifier:[[USER_DEFAULT objectForKey:@"AppleLanguages"]objectAtIndex:0]];
    NSString* dateStr = [[sender.date descriptionWithLocale:cnTime]substringToIndex:10];
    _birthdayLabel.text = dateStr;
    _birthday = sender.date;
}

- (IBAction)doneButtonTouch:(UIButton *)sender {
    
    _person.name = _name;
    _person.birthday = _birthday;
    _person.sex = _sex;
    _person.image = _image;
    
    
    _managedObjectContext = [(AppDelegate*) [[UIApplication sharedApplication] delegate] managedObjectContext];
    
    NSManagedObjectContext *context = _person.managedObjectContext;
    
    NSError *error = nil;
    if (![context save:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
        
        if (![_managedObjectContext save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }

    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:NSNotificationCenter_personInfoChange object:nil];
}
@end
