//
//  UIViewController+DependentComponentPickerViewController.h
//  Tab Bars and Pickers
//
//  Created by CISSAPP-13M on 6/10/15.
//  Copyright (c) 2015 Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DependentComponentPickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) NSDictionary *stateZips;
@property (weak, nonatomic) NSArray *states;
@property (weak, nonatomic) NSArray *zips;
@property (weak, nonatomic) IBOutlet UIPickerView *dependentPicker;

- (IBAction)buttonPressed:(id)sender;
@end
