//
//  UIViewController+DependentComponentPickerViewController.m
//  Tab Bars and Pickers
//
//  Created by CISSAPP-13M on 6/10/15.
//  Copyright (c) 2015 Garcia. All rights reserved.
//

#import "UIViewController+DependentComponentPickerViewController.h"

@implementation UIViewController (DependentComponentPickerViewController)

#define kStateComponent 0
#define kZipComponent 1

-(IBAction)buttonPressed:(id)sender {
    NSInteger stateRow = [self.dependentPicker selectedRowInComponent:kStateComponent];
    NSInteger zipRow = [self.dependentPicker selectedRowInComponent:kZipComponent];

    NSString *state = self.states[stateRow];
    NSString *zip = self.zips[zipRow];
    NSString *title = [[NSString alloc] initWithFormat: @"You selected zip code %@.", zip];
    NSString *message = [[NSString alloc] initWithFormat: @"%@ is in %@", zip, state];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"stateditionary" withExtension:@"plist"];
    self.stateZips = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    NSArray *allStates = [self.stateZips allKeys];
    NSArray *sortedStates = [allStates sortedArrayUsingSelector:@selector(compare)];
    self.states = sortedStates;
    NSString *selectedState = self.states[0];
    self.zips = self.stateZips[selectedState];
}

#pragma mark -
#pragma mark Picker Data Source Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPIckerView *)pickerView {
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsIinComponent:(NSInteger)component {
    if (component == kStateComponent) {
        return [self.states count];
    }else{
        return [self.zips count];
    }
}

#pragma mark Picker Delegate Methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == kStateComponent) {
        return self.states[row];
    }else{
        return self.zips[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == kStateComponent) {
        NSString *selectedState = self.states[row];
        self.zips = self.stateZips[selectedState];
        [self.dependentPicker reloadComponent:kZipComponent];
        [self.dependentPicker selectRow:0 inComponent:kZipComponent animated:YES];
    }
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == kZipComponent) {
        return 90;
    }else{
        return 200;
    }
}
@end