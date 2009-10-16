//
//  NonRectangularButtonAppDelegate.m
//  NonRectangularButton
//
//  Created by Ole Begemann on 16.10.09.
//  Copyright Ole Begemann 2009. All rights reserved.
//

#import "NonRectangularButtonAppDelegate.h"
#import "NonRectangularButtonViewController.h"

@implementation NonRectangularButtonAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
