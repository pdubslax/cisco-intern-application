//
//  urlViewController.h
//  internApp
//
//  Created by Patrick James Wilson on 6/24/13.
//  Copyright (c) 2013 Patrick James Wilson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface urlViewController : UIViewController
- (IBAction)button0:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *button0;
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *button3;
@property (strong, nonatomic) IBOutlet UIButton *button4;
@property (strong, nonatomic) IBOutlet UIButton *button5;
@property (strong, nonatomic) IBOutlet UIButton *button6;
@property (strong, nonatomic) UIButton *focus;
@property (nonatomic) CGRect frame1;
@property (nonatomic) CGRect frame2;
@property (nonatomic) CGRect frame3;
@property (nonatomic) CGRect frame4;
@property (nonatomic) CGRect frame5;
@property (nonatomic) CGRect frame6;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UITextView *text;
@property (strong, nonatomic) IBOutlet UILabel *vpname;



@end
