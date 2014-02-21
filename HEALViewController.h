//
//  HEALViewController.h
//  UserSettingsTest
//
//  Created by Eivind Bakke on 2/20/14.
//  Copyright (c) 2014 Halealei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HEALViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *sexTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
- (IBAction)updatePersonalDataButton:(id)sender;

@end
