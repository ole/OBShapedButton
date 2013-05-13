OBShapedButton
==============

OBShapedButton is a UIButton subclass optimized for non-rectangular button shapes.
Instances of OBShapedButton respond to touches only in areas where the image that is
assigned to the button for UIControlStateNormal is non-transparent.

 
How to Install
--------------

### Installation via CocoaPods

If possible, you should install `OBShapedButton` via [CocoaPods](http://cocoapods.org):

    $ edit Podfile
    platform :ios
    pod 'OBShapedButton'

### Manual Installation

If you cannot use CocoaPods for whatever reason, manually add OBShapedButton.h, OBShapedButton.m, UIImage+ColorAtPixel.h, and UIImage+ColorAtPixel.m to your Xcode project.


Usage
-----

* Design your UI in Interface Builder with UIButtons as usual. Set the Button type to Custom
  and provide transparent PNG images for the different control states as needed.
* In the Identity Inspector in Interface Builder, set the Class of the button to `OBShapedButton`.
  That's it! Your button will now only respond to touches where the PNG image for the normal
  control state is non-transparent.


Credits
-------
Written by Ole Begemann, ole@oleb.net  
http://oleb.net/blog/2009/10/obshapedbutton-non-rectangular-buttons-on-the-iphone/  
October, 2009

Corrected some serious bugs in April 2011. Thanks to the commenters on my blog and those who 
posted issues on GitHub for pointing them out, including the fixes.

Contributors:

* [balabhadra](https://github.com/balabhadra) added support for background images.
* [yurkins](https://github.com/yurkins) fixed an issue that only occurred in release builds.
* [Steven Zweier](https://github.com/SteveZz) fixed an issue that would intermittently result in wrong hit tests.


MIT License
-----------
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
