//
//  ViewController.m
//  AFSpritz-Demo
//
//  Created by Alvaro Franco on 3/1/14.
//  Copyright (c) 2014 AlvaroFranco. All rights reserved.
//

#import "ViewController.h"
#import "AFSpritzManager.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self updateLabelWithDelay:0.1];
    
    _label.textColor = [UIColor blackColor];
    _label.markingLinesColor = [UIColor blackColor];
    _label.textFont = [UIFont boldSystemFontOfSize:20];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[AFSpritzTimer sharedTimerManager]stopTimer];
}

-(void)toggleSpritz {
    AFSpritzWords *next = [[AFSpritzManager sharedManagerWithText:@"Welcome to AFSpritz! Spritz is a brand new revolutionary reading method that will help you to improve your number of words per minute. Take a look at AFSpritz!"]nextWordWithCompletion:^(BOOL success) {
        NSLog(@"Reading complete");
    }];
    
    if (next) {
        _label.word = next;
        [self updateLabelWithDelay:next.delay];
    }
}

-(void)updateLabelWithDelay:(NSTimeInterval)seconds {
    [[AFSpritzTimer sharedTimerManager]changeWordWithDelay:seconds target:self selector:@selector(toggleSpritz)];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
