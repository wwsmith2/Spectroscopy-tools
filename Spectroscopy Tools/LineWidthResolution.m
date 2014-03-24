//
//  LineWidthResolution.m
//  Spectroscopy Tools
//
//  Created by Wayne Smith on 3/18/14.
//  Copyright (c) 2014 WSmithConsulting. All rights reserved.
//

#import "LineWidthResolution.h"

@interface LineWidthResolution ()

@end

@implementation LineWidthResolution

//@synthesize centerWavelengthTextbox, linewidthTextbox;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Clear" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Enter" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    _centerWavelengthTextbox.inputAccessoryView = numberToolbar;
    _linewidthTextbox.inputAccessoryView = numberToolbar;

}

-(void)cancelNumberPad{
//    [_centerWavelengthTextbox resignFirstResponder];
//    [_linewidthTextbox resignFirstResponder];

    self.centerWavelengthTextbox.text = @"";
    self.linewidthTextbox.text = @"";
    
    
}

-(void)doneWithNumberPad{
    
    [_linewidthTextbox  resignFirstResponder];
    [_centerWavelengthTextbox resignFirstResponder];
}


- (IBAction)calculateCM:(id)sender {
    float CenterWavelength = [self.centerWavelengthTextbox.text floatValue];
    float LineWidth = [self.linewidthTextbox.text floatValue];
    float CM = 10000000 * LineWidth / pow(CenterWavelength, 2);
    
    self.wavenumberTextbox.text = [NSString stringWithFormat:@"%.3f", CM];
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

- (IBAction)calculateWavenumberButton:(id)sender {
    
    float CenterWavelength = [self.centerWavelengthTextbox.text floatValue];
    float LineWidth = [self.linewidthTextbox.text floatValue];
    float CM = 10000000 * LineWidth / pow(CenterWavelength, 2);
    
    self.wavenumberTextbox.text = [NSString stringWithFormat:@"%.3f", CM];
    
}
@end
