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

@end

@implementation AFSpritzManager

+(instancetype)sharedManagerWithText:(NSString *)text {
    
    static AFSpritzManager *sharedManager = nil;
    static dispatch_once_t once;

    dispatch_once(&once, ^{
        sharedManager = [self new];
        sharedManager.text = text;
    });
    
    return sharedManager;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        _current = 0;
    }
    return self;
}

- (void) setText:(NSString *)text {
    _text = text;
    NSArray *wordsSeparated = [self.text componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (wordsSeparated.count) {
        _current = 0;
        _words = wordsSeparated;
    }
}

-(AFSpritzWords *)nextWordWithCompletion:(statusBlock)completion {
    
    if (_current != _words.count) {
        if (!self.text)
            return nil;

        NSString *next = nil;
        do {
            next = [_words objectAtIndex:_current];
            ++_current;
            
        } while (!next.length);
        return [[AFSpritzWords alloc] initWithNextWord:next];
    } else {
        completion(YES);
        return nil;
    }
}

@end
