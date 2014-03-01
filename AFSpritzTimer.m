//
//  AFSpritzTimer.m
//  AFSpritz-Demo
//
//  Created by Alvaro Franco on 3/1/14.
//  Copyright (c) 2014 AlvaroFranco. All rights reserved.
//

#import "AFSpritzTimer.h"

@interface AFSpritzTimer ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation AFSpritzTimer

+(instancetype)sharedTimerManager {
    
    static AFSpritzTimer *sharedManager = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        sharedManager = [[self alloc] init];
    });
    
    return sharedManager;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)changeWordWithDelay:(NSTimeInterval)time target:(id)target selector:(SEL)selector {
    [_timer invalidate];
    _timer = nil;
    _timer = [NSTimer scheduledTimerWithTimeInterval:time target:target selector:selector userInfo:nil repeats:NO];
}

-(void)stopTimer {
    [_timer invalidate];
    _timer = nil;
}

@end
