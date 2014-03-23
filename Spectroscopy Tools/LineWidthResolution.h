//
//  LineWidthResolution.h
//  Spectroscopy Tools
//
//  Created by Wayne Smith on 3/18/14.
//  Copyright (c) 2014 WSmithConsulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineWidthResolution : UIViewController


@property (strong, nonatomic) IBOutlet UITextField *centerWavelengthTextbox;

@property (strong, nonatomic) IBOutlet UITextField *linewidthTextbox;

@property (strong, nonatomic) IBOutlet UITextField *wavenumberTextbox;

@property (strong, nonatomic) IBOutlet UIButton *calculateWavenumberButton;


@end
