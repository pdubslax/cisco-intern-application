//
//  rulesViewController.m
//  internApp
//
//  Created by Patrick James Wilson on 6/26/13.
//  Copyright (c) 2013 Patrick James Wilson. All rights reserved.
//

#import "rulesViewController.h"
#import "gameMainViewController.h"
#import <Parse/Parse.h>
#import <QuartzCore/QuartzCore.h>

@interface rulesViewController ()


@end

@implementation rulesViewController
@synthesize scoreLabel,text;
BOOL click =false;

int questions,correctq;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    self.navigationItem.title=@"Enter High Score!";
    [scoreLabel setText:[NSString stringWithFormat:@"Your Score is: %d", correctq]];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)button:(id)sender {
    if (click&&![text.text isEqualToString:@""]) {
        NSString *name = text.text;
        int score = correctq;
        NSString *scoreString = [NSString stringWithFormat:@"%d",score];
        
        PFObject *umm=[PFObject objectWithClassName:@"highScore"];
        [umm setObject:name forKey:@"name"];
        [umm setObject:scoreString forKey:@"score"];
        [umm saveInBackground];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
}
- (IBAction)addName:(id)sender {
    click=true;
}

- (IBAction)menu:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
