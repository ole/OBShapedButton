//
//  UIImage+ColorAtPixel.h
//  NonRectangularButton
//
//  Created by Ole Begemann on 16.10.09.
//  Copyright 2009 Ole Begemann. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (ColorAtPixel)

- (UIColor *)colorAtPixel:(CGPoint)point;

@end
