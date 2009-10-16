//
//  NonRectangularButtonViewController.m
//  NonRectangularButton
//
//  Created by Ole Begemann on 16.10.09.
//  Copyright Ole Begemann 2009. All rights reserved.
//

#import "NonRectangularButtonViewController.h"


@interface NonRectangularButtonViewController ()

- (void)toggleBackgroundColorOfView:(UIView *)coloredView;

@end





@implementation NonRectangularButtonViewController

@synthesize labelForNormalButton;
@synthesize labelForNonRectButton;
@synthesize coloredViewForNormalButton;
@synthesize coloredViewForNonRectButton;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    self.labelForNormalButton = nil;
    self.labelForNonRectButton = nil;
    self.coloredViewForNormalButton = nil;
    self.coloredViewForNonRectButton = nil;
}


- (void)dealloc {
    [labelForNormalButton release];
    [labelForNonRectButton release];
    [coloredViewForNormalButton release];
    [coloredViewForNonRectButton release];
    [super dealloc];
}


- (void)normalButtonTapped:(id)sender {
    NSLog(@"%s", __FUNCTION__);
    [self toggleBackgroundColorOfView:self.coloredViewForNormalButton];
}


- (void)nonRectButtonTapped:(id)sender {
    NSLog(@"%s", __FUNCTION__);
    [self toggleBackgroundColorOfView:self.coloredViewForNonRectButton];
}


- (void)toggleBackgroundColorOfView:(UIView *)coloredView {
    UIColor *firstColor  = [UIColor redColor];
    UIColor *secondColor = [UIColor greenColor];
    
    if (CGColorEqualToColor(coloredView.backgroundColor.CGColor, firstColor.CGColor)) {
        coloredView.backgroundColor = secondColor;
    } else {
        coloredView.backgroundColor = firstColor;
    }
}

@end
