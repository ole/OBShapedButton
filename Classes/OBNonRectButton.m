//
//  OBNonRectButton.m
//  NonRectangularButton
//
//  Created by Ole Begemann on 16.10.09.
//  Copyright 2009 Ole Begemann. All rights reserved.
//

#import "OBNonRectButton.h"

// -[UIView hitTest:withEvent: ignores views that an alpha level less than 0.1.
// So we will do the same and treat pixels with alpha < 0.1 as transparent.
#define kAlphaVisibleThreshold (0.1f);


@interface OBNonRectButton ()
- (BOOL)isPixelVisibleInImage:(UIImage *)image atPoint:(CGPoint)point;
@end



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
    
    return [self isPixelVisibleInImage:buttonImage atPoint:point];
}



// This also works when the button has a transform applied;
// point is always in local (untransformed) coordindates
- (BOOL)isPixelVisibleInImage:(UIImage *)image atPoint:(CGPoint)point {

    NSAssert(image != nil, @"image must not be nil");
    
    // Not visible if point is outside image coordinates
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, image.size.width, image.size.height), point)) {
        return NO;
    }
    
    // Draw just the pixel we are interested in into a 1x1-pixel byte array
    // Reference: http://stackoverflow.com/questions/1042830/retrieving-a-pixel-alpha-value-for-a-uiimage
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    CGImageRef cgImage = image.CGImage;
    NSUInteger width = CGImageGetWidth(cgImage);
    NSUInteger height = CGImageGetHeight(cgImage);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    int bytesPerPixel = 4;
    int bytesPerRow = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4] = { 0, 0, 0, 0 };
    CGContextRef context = CGBitmapContextCreate(pixelData, 
                                                 1,
                                                 1,
                                                 bitsPerComponent, 
                                                 bytesPerRow, 
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextTranslateCTM(context, -pointX, -pointY);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    
    // Test the value of the alpha channel against the threshold.
    // The alpha value ist the last byte in the array.
    unsigned char alpha = pixelData[3];
    return alpha >= kAlphaVisibleThreshold;
}

@end