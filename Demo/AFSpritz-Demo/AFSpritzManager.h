//
//  AFSpritzManager.h
//  AFSpritz-Demo
//
//  Created by Alvaro Franco on 3/1/14.
//  Copyright (c) 2014 AlvaroFranco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFSpritzWords.h"
#import "AFSpritzLabel.h"
#import "NSTimer+Blocks.h"

@interface AFSpritzManager : NSObject

typedef void (^statusBlock)(AFSpritzWords *word, BOOL finished);

-(id)initWithText:(NSString *)text andWordsPerMinute:(int)wpm;

@property (nonatomic, strong) NSString *text;

-(NSMutableArray *)packageOfWords;
-(void)updateLabelWithNewWordAndCompletion:(statusBlock)completion;

-(void)stopTimer;

@end
