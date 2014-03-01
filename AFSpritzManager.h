//
//  AFSpritzManager.h
//  AFSpritz-Demo
//
//  Created by Alvaro Franco on 3/1/14.
//  Copyright (c) 2014 AlvaroFranco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFSpritzWords.h"
#import "AFSpritzTimer.h"
#import "AFSpritzLabel.h"

@interface AFSpritzManager : NSObject

typedef void (^statusBlock)(BOOL success);

+(instancetype)sharedManagerWithText:(NSString *)text;

-(AFSpritzWords *)nextWordWithCompletion:(statusBlock)completion;

@property (nonatomic, strong) NSString *text;

@end
