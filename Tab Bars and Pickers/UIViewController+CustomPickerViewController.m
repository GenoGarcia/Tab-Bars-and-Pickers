//
//  UIViewController+CustomPickerViewController.m
//  Tab Bars and Pickers
//
//  Created by CISSAPP-13M on 6/10/15.
//  Copyright (c) 2015 Garcia. All rights reserved.
//

#import "UIViewController+CustomPickerViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation CustomPickerViewController

SystemSoundID winSoundID;
SystemSoundID crunchSoundID;

-(void)showButton {
    self.button.hidden = NO;
}

-(void)playWinSound {
    if (winSoundID == 0) {
        NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"win" withExtension:@"wav"];
        AudioServicesCreateSystemSoundID((_bridge CFURLRef)soundURL, &winSoundID);
    }
    AudioServicesPlaySystemSound(winSoundID);
    self.winLabel.text = @"WINNING!";
    [self performSelector:@selector(showButton) withObject:nil afterDelay:1.5];
}

-(IBAction)spin:(id)sender { 
	//If not working: the for-loop wasn't closed, so I added a }, possibly in the wrong spot.
    BOOL win = NO;
    int numInRow = 1;
    int lastVal = -1;
    for (int i = 0; i < 5; i++) {
        int newValue = random() % [self.images count];
        if (newValue == lastVal) {
            numInRow++;
        }else{
            numInRow = 1;
        }
            lastVal = newValue;
        [self.picker selectRow:newValue inComponent:i animated:YES];
        [self.picker reloadComponent:i];
        if (numInRow >= 3) {
            win = YES;
        }
        if (crunchSoundID == 0) {
            NSString *path = [[NSBundle mainBundle] pathForResource:@"crunch" ofType:@"wav"];
            NSURL *soundURL = [NSURL fileURLWithPath:path];
            AudioServicesCreateSystemSoundID((_bridge CFURLRef)soundURL, &crunchSoundID);
        }
        AudioServicesPlaySystemSound(crunchSoundID);
        if (win) {
            [self performSelector:@selector(playWinSound) withObject:nil afterDelay:.5];
        }else{
            [self performSelector:@selector(showButton) withObject:nil afterDelay:.5];
        }
        self.button.hidden = YES;
        self.winLabel.text = @"";
	}
}
                                   
-(void)viewDidLoad 
{
    [super viewDidLoad];
    _images = @[[UIImage imageNamed:@"seven"], [UIImage imageNamed:@"bar"], [UIImage imageNamed:@"crown"], [UIImage imageNamed:@"cherry"], [UIImage imageNamed:@"lemon"], [UIImage imageNamed:@"apple"]];
    srandom(time(NULL));
}
                                   
#pragma mark -
#pragma mark Picker Data Source Methods
-(int) numberOfComponentsInPickerView:(UIPickerView *)pickerView 
{
        return 5;
}
                                   
-(id)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reuseingView:(UIView *)view 
{                                       
	UIImage *image = self.images[row];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    return imageView;
}

@end