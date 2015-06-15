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
    NSInteger stateRow = [_dependentPicker selectedRowInComponent:kStateComponent];
    NSInteger zipRow = [_dependentPicker selectedRowInComponent:kZipComponent];

    NSString *state = _states[stateRow];
    NSString *zip = _zips[zipRow];
    NSString *title = [[NSString alloc] initWithFormat: @"You selected zip code %@.", zip];
    NSString *message = [[NSString alloc] initWithFormat: @"%@ is in %@", zip, state];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

-(void)viewDidLoad {
    [super ViewDidLoad];
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"stateditionary" withExtension:@"plist"];
    _stateZips = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    NSArray *allStates = [_stateZips allKeys];
    NSArray *sortedStates = [allStates sortedArrayUsingSelector:@selector(compare)];
    _states = sortedStates;
    NSString *selectedState = _states[0];
    _zips = _stateZips[selectedState];
}

#pragma mark -
#pragma mark Picker Data Source Methods
-(int)numberOfComponentsInPickerView:UIPIckerView *pickerView 
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsIinComponent:(NSInteger)component {
    if (component == kStateComponent) {
        return [_states count];
    }else{
        return [_zips count];
    }
}

#pragma mark Picker Delegate Methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == kStateComponent) {
        return _states[row];
    }else{
        return _zips[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == kStateComponent) {
        NSString *selectedState = _states[row];
        _zips = _stateZips[selectedState];
        [_dependentPicker reloadComponent:kZipComponent];
        [_dependentPicker selectRow:0 inComponent:kZipComponent animated:YES];
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