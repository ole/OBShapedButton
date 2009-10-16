//
//  NonRectangularButtonAppDelegate.h
//  NonRectangularButton
//
//  Created by Ole Begemann on 16.10.09.
//  Copyright Ole Begemann 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NonRectangularButtonViewController;

@interface NonRectangularButtonAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    NonRectangularButtonViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet NonRectangularButtonViewController *viewController;

@end

