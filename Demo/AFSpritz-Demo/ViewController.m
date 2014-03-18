//
//  ViewController.m
//  AFSpritz-Demo
//
//  Created by Alvaro Franco on 3/1/14.
//  Copyright (c) 2014 AlvaroFranco. All rights reserved.
//

#import "ViewController.h"
#import "SpritzViewController.h"
#import "AFPopupView.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UITextView *textView;
@property (nonatomic, strong) IBOutlet UIButton *showSpritzButton;
@property (nonatomic, strong) AFPopupView *popup;
@property (nonatomic, strong) SpritzViewController *spritzVC;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:Nil];
    _spritzVC = [storyboard instantiateViewControllerWithIdentifier:@"SpritzVC"];

    [_showSpritzButton addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hide) name:@"HideSpritzPopup" object:nil];
}

-(void)show {
    
    _spritzVC.text = _textView.text;
    _popup = [AFPopupView popupWithView:_spritzVC.view];
    [_popup show];
}

-(void)hide {
    
    [_popup hide];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [_textView resignFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
