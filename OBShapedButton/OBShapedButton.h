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
 OBShapedButton.h
 
 Created by Ole Begemann
 October, 2009
 */

#import <UIKit/UIKit.h>


/*
 OBShapedButton is a UIButton subclass optimized for non-rectangular button shapes.
 Instances of OBShapedButton respond to touches only in areas where the image that is
 assigned to the button for UIControlStateNormal is non-transparent.
 
 Usage:
 - Add OBShapedButton.h, OBShapedButton.m, UIImage+ColorAtPixel.h, and UIImage+ColorAtPixel.m
   to your Xcode project.
 - Design your UI in Interface Builder with UIButtons as usual. Set the Button type to Custom
   and provide transparent PNG images for the different control states as needed.
 - In the Identity Inspector in Interface Builder, set the Class of the button to OBShapedButton.
   That's it! Your button will now only respond to touches where the PNG image for the normal
   control state is non-transparent.
 */



// -[UIView hitTest:withEvent: ignores views that an alpha level less than 0.1.
// So we will do the same and treat pixels with alpha < 0.1 as transparent.
#define kAlphaVisibleThreshold (0.1f)


@interface OBShapedButton : UIButton {
    // Our class interface is empty. OBShapedButton only overwrites one method of UIView.
    // It has no attributes of its own.
}

@end
