//
//  AddAcroViewController.h
//  internApp
//
//  Created by Patrick James Wilson on 7/3/13.
//  Copyright (c) 2013 Patrick James Wilson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddAcroViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *in1;
@property (strong, nonatomic) IBOutlet UITextField *in2;

- (IBAction)submitBut:(id)sender;
- (IBAction)acro:(id)sender;
- (IBAction)acrodef:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lab1;
@property (strong, nonatomic) IBOutlet UILabel *lab2;

- (IBAction)addbut:(id)sender;

@end
