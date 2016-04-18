//
//  ViewController.m
//  TimecodeFormatter
//
//  Created by Jeschke, Mark on 4/17/16.
//  Copyright © 2016 Jeschke, Mark. All rights reserved.
//

#import "ViewController.h"

// Import the TimecodeFormatter class
#import "TimecodeFormatter.h"

@interface ViewController ()

@property (nonatomic, strong) TimecodeFormatter *timecodeFormatter;
@property (nonatomic, strong) NSString *timecode;
@property (nonatomic, weak) NSTimer *timecodeTimer;
@property (nonatomic) int seconds;
@property (weak, nonatomic) IBOutlet UILabel *timecodeDisplayLabel;
@property (weak, nonatomic) IBOutlet UIButton *startStopButton;

- (IBAction)startTimerAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize the timecodeFormatter object
    _timecodeFormatter = [[TimecodeFormatter alloc] init];
    
    // Initialize the timecodeDisplayLabel to display as "00:00:00"
    _timecodeDisplayLabel.text = [_timecodeFormatter timeFormatted:0];
    
    //Set the Start/Stop titles to update based upon their pressed actions
    [_startStopButton setTitle:@"▶︎ Start" forState:UIControlStateNormal];
    [_startStopButton setTitle:@"◼︎ Stop" forState:UIControlStateSelected];
    
}

- (void)incrementSecondsTick {
    // Increment the seconds integer count
    _timecode = [_timecodeFormatter timeFormatted:_seconds++];
    _timecodeDisplayLabel.text = _timecode;
    NSLog(@"Timecode: %@", _timecode);
}

- (IBAction)startTimerAction:(id)sender {
    if (!_timecodeTimer) {
        _timecodeDisplayLabel.text = [_timecodeFormatter timeFormatted:0];
        _seconds = 1;
        _timecodeTimer = [NSTimer scheduledTimerWithTimeInterval: 1.0f
                                                          target: self
                                                        selector: @selector(incrementSecondsTick)
                                                        userInfo: nil
                                                         repeats: YES];
        _startStopButton.selected = YES;
    } else {
        // Remove timecodeTimer
        [_timecodeTimer invalidate];
        _timecodeTimer = nil;
        _startStopButton.selected = NO;
    }
}

@end
