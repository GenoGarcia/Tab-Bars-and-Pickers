//
//  UIViewController+DoubleComponentPickerViewController.h
//  Tab Bars and Pickers
//
//  Created by CISSAPP-13M on 6/10/15.
//  Copyright (c) 2015 Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoubleComponentPickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *doublePicker;

@property (strong, nonatomic) NSArray *fillingTypes;

@property (strong, nonatomic) NSArray *breadTypes;

- (IBAction)buttonPressed:(id)sender;

@end
