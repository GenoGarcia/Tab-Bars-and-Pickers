//
//  UIViewController+DatePickerViewController.m
//  Tab Bars and Pickers
//
//  Created by CISSAPP-13M on 6/10/15.
//  Copyright (c) 2015 Garcia. All rights reserved.
//

#import "UIViewController+DatePickerViewController.h"

//UIDatePicker Code in Date Screen.
@implementation DatePickerViewController

- (IBAction)buttonPressed:(id)sender {
    NSDate *selected = [self.datePicker date];
    NSString *message = [[NSString alloc] initWithFormat:@"The date and time you selected is: %@", selected];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Date and Time Selected" message:message delegate:nil cancelButtonTitle:@"That's so true!" otherButtonTitles:nil];
    [alert show];
}

-(void)viewDidLoad {
    [super viewDidLoad];
        NSDate *now = [NSDate date];
        [_datePicker setDate:now animated:NO];
}

@end