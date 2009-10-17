//
//  NonRectangularButtonViewController.h
//  NonRectangularButton
//
//  Created by Ole Begemann on 16.10.09.
//  Copyright Ole Begemann 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OBNonRectButton;

@interface NonRectangularButtonViewController : UIViewController {
    UIButton *nonRectButton;
    UILabel *labelForNormalButton;
    UILabel *labelForNonRectButton;
    UIView *coloredViewForNormalButton;
    UIView *coloredViewForNonRectButton;
}

@property (nonatomic, retain) IBOutlet UIButton *nonRectButton;
@property (nonatomic, retain) IBOutlet UILabel *labelForNormalButton;
@property (nonatomic, retain) IBOutlet UILabel *labelForNonRectButton;
@property (nonatomic, retain) IBOutlet UIView *coloredViewForNormalButton;
@property (nonatomic, retain) IBOutlet UIView *coloredViewForNonRectButton;

- (void)normalButtonTapped:(id)sender;
- (void)nonRectButtonTapped:(id)sender;

@end

