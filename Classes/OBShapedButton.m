//
//  OBNonRectButton.m
//  NonRectangularButton
//
//  Created by Ole Begemann on 16.10.09.
//  Copyright 2009 Ole Begemann. All rights reserved.
//

#import "OBNonRectButton.h"
#import "UIImage+ColorAtPixel.h"


// -[UIView hitTest:withEvent: ignores views that an alpha level less than 0.1.
// So we will do the same and treat pixels with alpha < 0.1 as transparent.
#define kAlphaVisibleThreshold (0.1f);



@implementation OBNonRectButton

// UIView uses this method in hitTest:withEvent: to determine which subview should receive a touch event.
// If pointInside:withEvent: returns YES, then the subview’s hierarchy is traversed; otherwise, its branch
// of the view hierarchy is ignored.
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    // Return NO if even super returns NO (i.e., if point lies outside our bounds)
    BOOL superResult = [super pointInside:point withEvent:event];
    if (!superResult) {
        return superResult;
    }
    
    // We can't test the image's alpha channel if the button has no image. Fall back to super.
    UIImage *buttonImage = [self imageForState:UIControlStateNormal];
    if (buttonImage == nil) {
        return YES;
    }
    
    CGColorRef pixelColor = [[buttonImage colorAtPixel:point] CGColor];
    CGFloat alpha = CGColorGetAlpha(pixelColor);
    return alpha >= kAlphaVisibleThreshold;
}

@end