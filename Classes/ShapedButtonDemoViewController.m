/*
 Copyright (c) 2009 Ole Begemann
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

/*
 Demo project for OBShapedButton
 ShapedButtonDemoViewController.m
 
 Created by Ole Begemann
 October, 2009
 */

#import "ShapedButtonDemoViewController.h"


@interface ShapedButtonDemoViewController ()

- (void)toggleBackgroundColorOfView:(UIView *)coloredView;

@end





@implementation ShapedButtonDemoViewController

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
