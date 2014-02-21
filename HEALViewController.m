//
//  HEALViewController.m
//  UserSettingsTest
//
//  Created by Eivind Bakke on 2/20/14.
//  Copyright (c) 2014 Halealei. All rights reserved.
//

#import "HEALViewController.h"

@interface HEALViewController ()

@end

@implementation HEALViewController

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
    
    [[self weightTextField] setDelegate:self];
    [[self sexTextField] setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

- (IBAction)updatePersonalDataButton:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    
    if ([[self.weightTextField text] rangeOfCharacterFromSet:notDigits].location == NSNotFound){
        
        NSNumber *weight = [NSNumber numberWithDouble:[[self.weightTextField text] doubleValue]];
        [defaults setObject:weight forKey:@"userWeight"];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Input"
                                                        message:@"Please enter a whole number for weight."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    NSString *sex = [self.sexTextField text];
    
    if ([sex isEqualToString:@"M"] || [sex isEqualToString:@"F"]) {
        [defaults setObject:sex forKey:@"userSex"];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Input"
                                                        message:@"Please enter F or M for sex."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    @try {
        [defaults synchronize];
        NSLog(@"Data saved");
    }
    @catch (NSException *exception) {
        NSLog(@"Data save failed.");
    }}
@end
