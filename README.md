AFSpritz
=======================

A complete Spritz SDK for iOS

![alt text](https://raw.github.com/AlvaroFranco/AFSpritz/master/example.gif "Example")

##CocoaPods

AFSpritz is on [CocoaPods](http://cocoapods.org), so you can get the pod by adding this line to your Podfile

    pod 'AFSpritz', '~> 1.2'

If not, just import these files to your project:

    AFSpritzManager.h
    AFSpritzManager.m
    AFSpritzWords.h
    AFSpritzWords.m
    AFSpritzLabel.h
    AFSpritzLabel.m
    NSTimer+Blocks.h
    NSTimer+Blocks.m

##Usage

First of all, import AFSpritzManager.h to your class

    #import "AFSpritzManager.h"

Initialise ```AFSpritzManager``` assigning a text and a number of words per minute, that will determine the speed of the reading. Theorically, there's no limit, but the more confortable speed is 200-250 words per minute. However, Spritz is made for let you read more than 500 words per minute.

    AFSpritzManager *manager = [[AFSpritzManager alloc]initWithText:@"Welcome to AFSpritz! Spritz is a brand new revolutionary reading method that will help you to improve your number of words per minute. Take a look at AFSpritz!" andWordsPerMinute:250];

Then, call the block that will update the Spritz label

    [manager updateLabelWithNewWordAndCompletion:^(AFSpritzWords *word, BOOL finished) {

        if (!finished) {

			//Update the AFSpritzLabel

        } else {
            NSLog(@"Finished!");
        }
    }];
	
###Checking the status

	typedef NS_ENUM(int, AFSpritzStatus) {
    	AFSpritzStatusStopped,
    	AFSpritzStatusReading,
    	AFSpritzStatusNotStarted,
    	AFSpritzStatusFinished
	};

AFSpritz has the feature of checking in each moment the status of the reading using ```-status:```.

Example:

	if ([manager status:AFSpritzStatusReading]) {
		// The current status is reading
	} else if ([manager status:AFSpritzStatusNotStarted]) {
		// The current status is not started yet
	}
	
NOTE: *AFSpritzStatusStopped* is totally useless at the moment. It will be enabled in future versions where this feature (and more!) will be added.

###Pausing and resuming

Now you can pause and resume your reading just calling these two methods:

	[manager pauseReading];

	[manager resumeReading];
	

##AFSpritzLabel API

AFSpritzLabel is an incredible, well crafted and 100% AFSpritzWords-compatible UIView subclass that will let you show your Spritz reading.

You can customize many properties from AFSpritzLabel, such as:

| Property | Class | Required | Default | Description |
|----------|-------|----------|---------|-------------|
| word | AFSpritzWords | Yes | nil | Determines the AFSpritzWords-subclassed word to show. |
| markerColor | UIColor | No | Red | Determines the color of the letter you're supposed to be focused on. |
| markeringLinesColor | UIColor | No | Black | Determines the color of the lines around the word. |
| textColor | UIColor | No | Black | Determines the color of the text. |
| textFont | UIFont | No | System font with size 20 | Determines the font of the text. |
| backgroundColor | UIColor | No | White | Determines the color of the background. |

##Wishlist

1. ~~Customize speed throught the number of words per minute.~~ 

2. ~~Stop and resume the reading~~.

3. Add a little stop when there's a stop on the text (. … : , ! ?).

4. Restart the reading.

##Author

Made by Alvaro Franco. If you have any question, feel free to drop me a line at [alvarofrancoayala@gmail.com](mailto:alvarofrancoayala@gmail.com)