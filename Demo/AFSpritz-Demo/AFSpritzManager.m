//
//  AFSpritzManager.m
//  AFSpritz-Demo
//
//  Created by Alvaro Franco on 3/1/14.
//  Copyright (c) 2014 AlvaroFranco. All rights reserved.
//

#import "AFSpritzManager.h"

@interface AFSpritzManager ()

@property (nonatomic, strong) NSString *text;

@property (nonatomic, strong) NSArray *words;
@property (nonatomic) NSUInteger current;
@property (nonatomic) float speed;
@property (nonatomic) NSTimer *timer;

@property (nonatomic) int status;

@property (nonatomic, strong) NSDate *pauseDate;
@property (nonatomic, strong) NSDate *previousFireDate;

-(NSMutableArray *)packageOfWords;

-(BOOL)containsFullStop:(NSString *)wordToAnalyze;

@end

@implementation AFSpritzManager

-(id)initWithText:(NSString *)text andWordsPerMinute:(int)wpm {
    
    self = [super init];
    
    if (self) {
        
        _status = AFSpritzStatusNotStarted;
        
        _text = text;
        _speed = (wpm / 60);
        _speed = (1/_speed);

        NSArray *wordsSeparated = [self.text componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        NSMutableArray *fixedArray = [NSMutableArray array];
        
        for (NSString *singleWord in wordsSeparated) {
            [fixedArray addObject:[singleWord stringByAppendingString:@" "]];
        }
        
        if (fixedArray.count) {
            _current = 0;
            _words = fixedArray;
        }
    }
    
    return self;
}

-(void)updateLabelWithNewWordAndCompletion:(statusBlock)completion {
    
    NSMutableArray *wordsArray = [self packageOfWords];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:_speed block:^{
        
        if (_current != wordsArray.count) {
            
            if (_current > 0) {
                
                if ([self containsFullStop:[(AFSpritzWords *)wordsArray[_current - 1]word]]) {
                    clock_t end = clock() + (_speed/2 * CLOCKS_PER_SEC);
                    while (clock() < end)
                        ;
                }
            }
            
            NSLog(@"%@",[(AFSpritzWords *)wordsArray[_current]word]);
            
            _status = AFSpritzStatusReading;

            completion([wordsArray objectAtIndex:_current], NO);
            _current++;
        } else if (_current == wordsArray.count) {
            
            completion(nil, YES);
            [_timer invalidate];
            _status = AFSpritzStatusFinished;
        }
        
    } repeats:YES];
}

-(BOOL)containsFullStop:(NSString *)wordToAnalyze {
    
    if ([wordToAnalyze rangeOfString:@". "].location != NSNotFound) {
        return YES;
    } else if ([wordToAnalyze rangeOfString:@"! "].location != NSNotFound) {
        return YES;
    } else {
        return NO;
    }
}

-(NSMutableArray *)packageOfWords {
    
    NSMutableArray *tempArray = [NSMutableArray array];
    
    for (NSString *word in _words) {
        [tempArray addObject:[[AFSpritzWords alloc]initWithNextWord:word]];
    }
        
    return tempArray;
}

-(BOOL)status:(AFSpritzStatus)spritzStatus {

    if (spritzStatus == _status) {
        return YES;
    } else {
        return NO;
    }
}

@end
