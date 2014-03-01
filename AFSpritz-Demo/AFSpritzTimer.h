//
//  AFSpritzTimer.h
//  AFSpritz-Demo
//
//  Created by Alvaro Franco on 3/1/14.
//  Copyright (c) 2014 AlvaroFranco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFSpritzTimer : NSObject

+(instancetype)sharedTimerManager;

-(void)changeWordWithDelay:(NSTimeInterval)time target:(id)target selector:(SEL)selector;
-(void)stopTimer;

@end
