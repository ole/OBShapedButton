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

@synthesize nonRectButton;
@synthesize labelForNormalButton;
@synthesize labelForNonRectButton;
@synthesize coloredViewForNormalButton;
@synthesize coloredViewForNonRectButton;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

    self.nonRectButton.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(2.0, 1.0), M_PI_2);
    CGAffineTransform t = CGAffineTransformIdentity;
    t = CGAffineTransformRotate(t, M_PI / 8.0f);
    t = CGAffineTransformTranslate(t, 20.0f, 150.0f);
    t = CGAffineTransformScale(t, 2.0f, 1.0f);
    self.nonRectButton.transform = t;
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    self.nonRectButton = nil;
    self.labelForNormalButton = nil;
    self.labelForNonRectButton = nil;
    self.coloredViewForNormalButton = nil;
    self.coloredViewForNonRectButton = nil;
}


- (void)dealloc {
    [nonRectButton release];
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
