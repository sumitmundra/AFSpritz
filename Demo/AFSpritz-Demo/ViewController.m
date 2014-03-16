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
    
    UIButton *restartButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 180, 100, 50)];
    [restartButton setTitle:@"Restart" forState:UIControlStateNormal];
    [restartButton addTarget:self action:@selector(toggleSpritz) forControlEvents:UIControlEventTouchUpInside];
    restartButton.titleLabel.textColor = [UIColor blackColor];
    [self.view addSubview:restartButton];
    
    [self toggleSpritz];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

-(void)toggleSpritz {
    AFSpritzManager *manager = [[AFSpritzManager alloc]initWithText:@"Welcome to AFSpritz! Spritz is a brand new revolutionary reading method that will help you to improve your number of words per minute. Take a look at AFSpritz!" andWordsPerMinute:250];
    
    [manager updateLabelWithNewWordAndCompletion:^(AFSpritzWords *word, BOOL finished) {
       
        if (!finished) {
            
            AFSpritzLabel *spritzLabel = [[AFSpritzLabel alloc]initWithFrame:CGRectMake(20, 20, 200, 40)];
            spritzLabel.center = CGPointMake([[UIScreen mainScreen]bounds].size.width / 2, 100);
            spritzLabel.word = word;
            [self.view addSubview:spritzLabel];
        } else {
            NSLog(@"Finished!");
        }
    }];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
