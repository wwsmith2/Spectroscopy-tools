//
//  SpectrometerResolution.m
//  Spectroscopy Tools
//
//  Created by Wayne Smith on 3/18/14.
//  Copyright (c) 2014 WSmithConsulting. All rights reserved.
//

#import "SpectrometerResolution.h"

@interface SpectrometerResolution ()

//@synthesize textboxWavelengthBegin, textboxWavelengthEnd, textboxNumberPixels, textboxPixelWidth, textboxSlitWidth, textboxResolutionNM, textboxResolutionCM;
@end


@implementation SpectrometerResolution


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
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Enter" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    _textboxWavelengthBegin.inputAccessoryView = numberToolbar;
    _textboxWavelengthEnd.inputAccessoryView = numberToolbar;
    _textboxNumberPixels.inputAccessoryView = numberToolbar;
    _textboxPixelWidth.inputAccessoryView = numberToolbar;
    _textboxSlitWidth.inputAccessoryView = numberToolbar;
    
}

#define k_KEYBOARD_OFFSET 75.0

-(void)keyboardWillAppear {
    
    // Move current view up / down with Animation
    if (self.view.frame.origin.y >= 0)
    {
        [self moveViewUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self moveViewUp:NO];
    }
    
}

-(void)keyboardWillDisappear {
    if (self.view.frame.origin.y >= 0)
    {
        [self moveViewUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self moveViewUp:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    if ([sender isEqual:_textboxWavelengthBegin]) // txtEmail is UITextField control for email address
    {
        //move the main view up, so the keyboard will not hide it.
        if  (self.view.frame.origin.y >= 0)
        {
            [self moveViewUp:YES];
        }
    }
}

//Custom method to move the view up/down whenever the keyboard is appeared / disappeared
-(void)moveViewUp:(BOOL)bMovedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.4]; // to slide the view up
    
    CGRect rect = self.view.frame;
    if (bMovedUp) {
        // 1. move the origin of view up so that the text field will come above the keyboard
        rect.origin.y -= k_KEYBOARD_OFFSET;
        
        // 2. increase the height of the view to cover up the area behind the keyboard
        rect.size.height += k_KEYBOARD_OFFSET;
    } else {
        // revert to normal state of the view.
        rect.origin.y += k_KEYBOARD_OFFSET;
        rect.size.height -= k_KEYBOARD_OFFSET;
    }
    
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

- (void)viewWillAppear:(BOOL)animated
{
    // register keyboard notifications to appear / disappear the keyboard
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillAppear)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillDisappear)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    // unregister for keyboard notifications while moving to the other screen.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}



-(void)cancelNumberPad{
    [_textboxWavelengthBegin resignFirstResponder];
    [_textboxWavelengthEnd resignFirstResponder];
    [_textboxNumberPixels resignFirstResponder];
    [_textboxPixelWidth resignFirstResponder];
    [_textboxSlitWidth resignFirstResponder];
    
}

-(void)doneWithNumberPad{
    
    [_textboxWavelengthBegin resignFirstResponder];
    [_textboxWavelengthEnd resignFirstResponder];
    [_textboxNumberPixels resignFirstResponder];
    [_textboxPixelWidth resignFirstResponder];
    [_textboxSlitWidth resignFirstResponder];
}

- (IBAction)calculateResolution:(id)sender {
    
    float waveBegin = [self.textboxWavelengthBegin.text floatValue];
    float waveEnd = [self.textboxWavelengthEnd.text floatValue];
    float numPixels = [self.textboxNumberPixels.text floatValue];
    float pixWidth = [self.textboxPixelWidth.text floatValue];
    float slitWidth = [self.textboxSlitWidth.text floatValue];
    float resolutionNM;
    float resolutionCM;
    float centerWavelength = waveBegin + ((waveEnd - waveBegin) / 2);
    
    
    // calculate the resolution factor
    // if (SlitWidth / PixelWidth) ~1 then 3.0 pixels are needed
    // if (SlitWidth / PixelWidth) ~2 then 2.5 pixels are needed
    // if (SlitWidth / PixelWidth) ~3 then 2.0 pixels are needed
    // if (SlitWidth / PixelWidth) ~4 then 1.5 pixels are needed
    // we can use an equation to estimate this
    float resolutionFactor = ((-0.5) * (slitWidth / pixWidth)) + 3.5;
    
    resolutionNM = resolutionFactor * (waveEnd - waveBegin)*slitWidth / (numPixels * pixWidth);
    resolutionCM = 10000000 * resolutionNM / pow(centerWavelength, 2);
    
    self.textboxResolutionNM.text = [NSString stringWithFormat:@"%.2f", resolutionNM];
    self.textboxResolutionCM.text = [NSString stringWithFormat:@"%.2f", resolutionCM];
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
