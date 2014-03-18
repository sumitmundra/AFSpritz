//
//  ViewController.m
//  AFSpritz-Demo
//
//  Created by Alvaro Franco on 3/1/14.
//  Copyright (c) 2014 AlvaroFranco. All rights reserved.
//

#import "ViewController.h"
#import "AFSpritzManager.h"
#import <objc/message.h>

@interface ViewController ()

@property (nonatomic, strong) UIButton *restartButton;
@property (nonatomic, strong) AFSpritzManager *manager;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _restartButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 180, 100, 50)];
    [_restartButton setTitle:@"Start" forState:UIControlStateNormal];
    [_restartButton addTarget:self action:@selector(toggleSpritz) forControlEvents:UIControlEventTouchUpInside];
    _restartButton.titleLabel.textColor = [UIColor blackColor];
    [self.view addSubview:_restartButton];
    
    [self toggleSpritz];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

-(void)toggleSpritz {
    AFSpritzManager *manager = [[AFSpritzManager alloc]initWithText:@"Welcome to AFSpritz! Spritz is a brand new revolutionary reading method that will help you to improve your number of words per minute. Take a look at AFSpritz!" andWordsPerMinute:550];
    
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
