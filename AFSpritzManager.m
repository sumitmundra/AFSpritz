//
//  AFSpritzManager.m
//  AFSpritz-Demo
//
//  Created by Alvaro Franco on 3/1/14.
//  Copyright (c) 2014 AlvaroFranco. All rights reserved.
//

#import "AFSpritzManager.h"

@interface AFSpritzManager ()

@property (nonatomic, strong) NSArray *words;
@property (nonatomic) NSUInteger current;
@property (nonatomic) float speed;
@property (nonatomic) NSTimer *timer;

@end

@implementation AFSpritzManager

-(id)initWithText:(NSString *)text andWordsPerMinute:(int)wpm {
    
    self = [super init];
    
    if (self) {
        
        _text = text;
        _speed = (wpm / 60);
        _speed = (1/_speed);

        NSArray *wordsSeparated = [self.text componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if (wordsSeparated.count) {
            _current = 0;
            _words = wordsSeparated;
        }
    }
    
    return self;
}

-(void)updateLabelWithNewWordAndCompletion:(statusBlock)completion {
    
    NSMutableArray *wordsArray = [self packageOfWords];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:_speed block:^{
        
        if (_current != wordsArray.count) {
            
            completion([wordsArray objectAtIndex:_current], NO);
            _current++;
        } else if (_current == wordsArray.count) {
            
            completion(nil, YES);
            [_timer invalidate];
        }
        
    } repeats:YES];
}

-(NSMutableArray *)packageOfWords {
    
    NSMutableArray *tempArray = [NSMutableArray array];
    
    for (NSString *word in _words) {
        [tempArray addObject:[[AFSpritzWords alloc]initWithNextWord:word]];
    }
        
    return tempArray;
}

-(void)stopTimer {
    
    [_timer invalidate];
}

@end
