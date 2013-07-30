//
//  gameViewController.h
//  internApp
//
//  Created by Patrick James Wilson on 6/26/13.
//  Copyright (c) 2013 Patrick James Wilson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface gameViewController : UIViewController

- (IBAction)quit:(id)sender;

@property (strong, nonatomic) IBOutlet UITextView *textbox;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UIImageView *image2;
@property (strong, nonatomic) IBOutlet UIButton *button0;
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *button3;
@property (strong, nonatomic) IBOutlet UIButton *nextbutton;

@property (strong,nonatomic) NSMutableArray *names;
@property (strong,nonatomic) NSMutableArray *pictures;
@property (strong,nonatomic) NSMutableArray *wrongGuy;
@property (strong,nonatomic) NSMutableArray *wrongGirl;
@property (strong,nonatomic) NSMutableArray *male;
@property (strong,nonatomic) NSMutableArray *jobs;

@property (nonatomic) CGRect f0;
@property (nonatomic) CGRect f1;
@property (nonatomic) CGRect f2;
@property (nonatomic) CGRect f3;
@property (nonatomic) CGRect fnext;
@property (nonatomic) CGRect imagePos;
@property (nonatomic) CGRect textPos;

@property (strong, nonatomic) IBOutlet UIButton *resultButton;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;

// count keeps track of score
extern int questions,correctq,correctTag;

@property (strong, nonatomic) IBOutlet UIProgressView *progView;
@property (strong, nonatomic) IBOutlet UILabel *progLabel;
@property BOOL answered;

- (IBAction)buttonPressed:(id)sender;
- (IBAction)nextButton:(id)sender;



@end
