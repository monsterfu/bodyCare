//
//  RecordLineViewController.m
//  bodyCare
//
//  Created by Monster on 14-8-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "RecordLineViewController.h"

@interface RecordLineViewController ()

@end

@implementation RecordLineViewController

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
    [_datePicker fillCurrentYear];
    NSDate* today = [NSDate date];
    [_datePicker selectDate:[NSDate dateWithYear:today.year Month:today.month]];
    [_datePicker setDelegate:self];
    
    self.ArrayOfValues = [[NSMutableArray alloc] init];
    self.ArrayOfDates = [[NSMutableArray alloc] init];
    
    //    totalNumber = 0;
    
    for (int i=0; i < 17; i++) {
        [self.ArrayOfValues addObject:[NSNumber numberWithInteger:(arc4random() % 70000)]]; // Random values for the graph
        [self.ArrayOfDates addObject:[NSString stringWithFormat:@"%@:00",[NSNumber numberWithInt:i]]]; // Dates for the X-Axis of the graph
        
        //        totalNumber = totalNumber + [[self.ArrayOfValues objectAtIndex:i] intValue]; // All of the values added together
    }
    
    /* This is commented out because the graph is created in the interface with this sample app. However, the code remains as an example for creating the graph using code.
     BEMSimpleLineGraphView *myGraph = [[BEMSimpleLineGraphView alloc] initWithFrame:CGRectMake(0, 60, 320, 250)];
     myGraph.delegate = self;
     [self.view addSubview:myGraph]; */
    
    // Customization of the graph
    self.recordLine.delegate = self;
    self.recordLine.enableTouchReport = YES;
    self.recordLine.colorTop = [UIColor clearColor];
    self.recordLine.colorBottom = [UIColor clearColor]; // Leaving this not-set on iOS 7 will default to your window's tintColor
    self.recordLine.colorLine = [UIColor grayColor];
    self.recordLine.backgroundColor = [UIColor clearColor];
    self.recordLine.colorXaxisLabel = [UIColor blackColor];
    self.recordLine.widthLine = 3.0;
    self.recordLine.enableTouchReport = YES;
}

- (void)updateSelectedDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = [NSDateFormatter dateFormatFromTemplate:@"EEEEddMMMM" options:0 locale:nil];
    
//    self.selectedDateLabel.text = [formatter stringFromDate:self.datepicker.selectedDate];
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

- (IBAction)rightButtonTouch:(UIButton *)sender {
    if (self.delegate&&[self.delegate respondsToSelector:@selector(RecordLineViewControllerLeftButtonTouch)]) {
        [self.delegate RecordLineViewControllerLeftButtonTouch];
    }
}

#pragma mark - SimpleLineGraph Data Source

- (int)numberOfPointsInGraph {
    return (int)[self.ArrayOfValues count];
}

- (float)valueForIndex:(NSInteger)index {
    return [[self.ArrayOfValues objectAtIndex:index] floatValue];
}


#pragma mark - SimpleLineGraph Delegate

- (int)numberOfGapsBetweenLabels {
    return 1;
}

- (NSString *)labelOnXAxisForIndex:(NSInteger)index {
    return [self.ArrayOfDates objectAtIndex:index];
}
//
//- (void)didTouchGraphWithClosestIndex:(int)index {
//    self.labelValues.text = [NSString stringWithFormat:@"%@", [self.ArrayOfValues objectAtIndex:index]];
//
//    self.labelDates.text = [NSString stringWithFormat:@"in %@", [self.ArrayOfDates objectAtIndex:index]];
//}
//
//- (void)didReleaseGraphWithClosestIndex:(float)index {
//    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//        self.labelValues.alpha = 0.0;
//        self.labelDates.alpha = 0.0;
//    } completion:^(BOOL finished){
//
//        self.labelValues.text = [NSString stringWithFormat:@"%i", totalNumber];
//        self.labelDates.text = @"between 2000 and 2010";
//
//        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//            self.labelValues.alpha = 1.0;
//            self.labelDates.alpha = 1.0;
//        } completion:nil];
//    }];
//
//}

-(void)allAnimationDidFinished
{
    NSLog(@"allAnimationDidFinished");
}
#pragma mark - DIDatepickerDelegate
-(void)DIDatepickerDidSeletedDate:(NSDate *)date
{
    [self.ArrayOfValues removeAllObjects];
    [self.ArrayOfDates removeAllObjects];
    
    for (int i = 0; i < 17; i++) {
        [self.ArrayOfValues addObject:[NSNumber numberWithInteger:(arc4random() % 70000)]]; // Random values for the graph
        [self.ArrayOfDates addObject:[NSString stringWithFormat:@"%@",[NSNumber numberWithInt:2000 + i]]]; // Dates for the X-Axis of the graph
        
        //        totalNumber = totalNumber + [[self.ArrayOfValues objectAtIndex:i] intValue]; // All of the values added together
    }
    
    UIColor *color;
    //    if (self.graphColorChoice.selectedSegmentIndex == 0) color = [UIColor colorWithRed:31.0/255.0 green:187.0/255.0 blue:166.0/255.0 alpha:1.0];
    //    else if (self.graphColorChoice.selectedSegmentIndex == 1) color = [UIColor colorWithRed:255.0/255.0 green:187.0/255.0 blue:31.0/255.0 alpha:1.0];
    //    else if (self.graphColorChoice.selectedSegmentIndex == 2) color = [UIColor colorWithRed:0.0 green:140.0/255.0 blue:255.0/255.0 alpha:1.0];
    color = [UIColor clearColor];//[UIColor colorWithRed:31.0/255.0 green:187.0/255.0 blue:166.0/255.0 alpha:1.0];
    self.recordLine.colorTop = color;
    self.recordLine.colorBottom = color;
    self.recordLine.backgroundColor = color;
    self.view.tintColor = color;
    //    self.labelValues.textColor = color;
    //    self.navigationController.navigationBar.tintColor = color;
    
    [self.recordLine reloadGraph];
}
@end
