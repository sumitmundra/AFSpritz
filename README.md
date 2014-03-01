AFSpritz
=======================

A complete Spritz SDK for iOS

![alt text](https://raw.github.com/AlvaroFranco/AFSpritz/master/example.gif "Example")

##CocoaPods

AFSpritz is on [CocoaPods](http://cocoapods.org), so you can get the pod by adding this line to your Podfile

    pod 'AFSpritz', '~> 1.0'

If not, just import these files to your project:

    AFSpritzManager.h
    AFSpritzManager.m
    AFSpritzWords.h
    AFSpritzWords.m
    AFSpritzTimer.h
    AFSpritzTimer.m
    AFSpritzLabel.h
    AFSpritzLabel.m

##Usage

First of all, import AFSpritzManager.h to your class

    #import "AFSpritzManager.h"

Add a method that will change the words

    -(void)updateLabelWithDelay:(NSTimeInterval)seconds {
       [[AFSpritzTimer sharedTimerManager]changeWordWithDelay:seconds target:self selector:@selector(toggleSpritz)];
    }


Then, add a method that will handle the change of words

    -(void)toggleSpritz {
        AFSpritzWords *next = [[AFSpritzManager sharedManagerWithText:@"Rise above, gonna start the war!\n Oh, what you want, what you need What'd you come here for? Well, an eye for an eye and an 'f' for fight Taking me down as the prisoners riot"]nextWordWithCompletion:^(BOOL success) {
            NSLog(@"Reading complete");
        }];

        if (next) {
            _label.word = next;
            [self updateLabelWithDelay:next.delay];
        }
    }

When the readding is finished, the block will be called.

To start the readding, just call the method we added at the first step by adding this line

    [self updateLabelWithDelay:0.1];

You can change the speed by replacing the delay.
If you want to stop it before it finishes, call the stopTimer method of AFSpritzTimer

    [[AFSpritzTimer sharedTimerManager]stopTimer];

You can also customize the label with the following properties:

    markerColor
    markingLinesColor
    textColor
    textFont

##Author

Done by Alvaro Franco