//
//  SpectrometerResolution.h
//  Spectroscopy Tools
//
//  Created by Wayne Smith on 3/18/14.
//  Copyright (c) 2014 WSmithConsulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpectrometerResolution : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *btnCalculateResolution;
@property (strong, nonatomic) IBOutlet UITextField *textboxWavelengthBegin;
@property (strong, nonatomic) IBOutlet UITextField *textboxWavelengthEnd;
@property (strong, nonatomic) IBOutlet UITextField *textboxNumberPixels;
@property (strong, nonatomic) IBOutlet UITextField *textboxPixelWidth;
@property (strong, nonatomic) IBOutlet UITextField *textboxSlitWidth;
@property (strong, nonatomic) IBOutlet UITextField *textboxResolutionNM;
@property (strong, nonatomic) IBOutlet UITextField *textboxResolutionCM;

@end
