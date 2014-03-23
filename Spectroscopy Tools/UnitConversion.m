//
//  UnitConversion.m
//  Spectroscopy Tools
//
//  Created by Wayne Smith on 3/18/14.
//  Copyright (c) 2014 WSmithConsulting. All rights reserved.
//

#import "UnitConversion.h"

@interface UnitConversion ()

@end

@implementation UnitConversion

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

@synthesize valueTextField, convertedValue, unitValue;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Enter" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    valueTextField.inputAccessoryView = numberToolbar;
    
}

-(void)cancelNumberPad{
    [valueTextField resignFirstResponder];
    
 //   self.valueTextField.text = @"";
 //   self.convertedValue = @"";
//    self.units.text = @"nm";
}

-(void)doneWithNumberPad{
    
    [valueTextField resignFirstResponder];
    
    float tempValue =  [self.valueTextField.text floatValue];
    float CM;
    float NM;
    
    switch (unitValue.selectedSegmentIndex) {
        case 0:  //nm

            // converting nm to cm-1
            NM = (1 / tempValue) * 10000000;
            self.convertedValue.text = [NSString stringWithFormat:@"%.3f", NM];
            self.units.text = [NSString stringWithFormat:@"cm-1"];
            
            break;
        case 1:  // cm-1
            
            // converting cm-1 to nm
            CM = (1 / tempValue) * 10000000;
            self.convertedValue.text = [NSString stringWithFormat:@"%.3f", CM];
            self.units.text = [NSString stringWithFormat:@"nm"];
            
            break;
            
        default:
            break;
    }
    

    
    
}

- (IBAction)unitValueChange:(id)sender {
    
    self.valueTextField.text = @"";
    self.convertedValue.text = @"";
    
    switch (unitValue.selectedSegmentIndex) {
        case 0:
            // converting nm to cm-1
            self.units.text = [NSString stringWithFormat:@"cm-1"];
            break;

        case 1:
            // converting cm-1 to nm
            self.units.text = [NSString stringWithFormat:@"nm"];
            break;
            
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
