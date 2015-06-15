//
//  UIViewController+DatePickerViewController.h
//  Tab Bars and Pickers
//
//  Created by CISSAPP-13M on 6/10/15.
//  Copyright (c) 2015 Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)buttonPressed:(id)sender;
@end
