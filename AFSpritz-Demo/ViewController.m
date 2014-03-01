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
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[AFSpritzTimer sharedTimerManager]stopTimer];
}

-(void)toggleSpritz {
    AFSpritzWords *next = [[AFSpritzManager sharedManagerWithText:@"Rise above, gonna start the war! Oh, what you want, what you need, what'd you come here for? Well, an eye for an eye and an 'f' for fight. Taking me down as the prisoners riot"]nextWordWithCompletion:^(BOOL success) {
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
