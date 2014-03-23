//
//  UnitConversion.h
//  Spectroscopy Tools
//
//  Created by Wayne Smith on 3/18/14.
//  Copyright (c) 2014 WSmithConsulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnitConversion : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *valueTextField;

@property (strong, nonatomic) IBOutlet UITextField *convertedValue;

@property (strong, nonatomic) IBOutlet UILabel *units;

@property (strong, nonatomic) IBOutlet UISegmentedControl *unitValue;

@end
