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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


//- (IBAction)wavenumbers:(id)sender {
  
   // float CM = [self.wavenumbers.text floatvalue];
    //float NM = CM / 10000000;
    //self.nanometers.text = [NSString stringWithFormat:@"%.2f", NM];
    
//}

- (IBAction)nanometer:(id)sender {
}

- (IBAction)microns:(id)sender {
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
