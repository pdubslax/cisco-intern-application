//
//  AddAcroViewController.m
//  internApp
//
//  Created by Patrick James Wilson on 7/3/13.
//  Copyright (c) 2013 Patrick James Wilson. All rights reserved.
//

#import "AddAcroViewController.h"
#import <Parse/Parse.h>
#import <QuartzCore/QuartzCore.h>
#import "SearchTutorialViewController.h"


@interface AddAcroViewController ()

@end

@implementation AddAcroViewController
@synthesize in1,in2,lab1,lab2;
BOOL one =false;
BOOL two =false;
NSMutableArray *tmp1;
NSMutableArray *tmp2;
NSMutableArray *acronymlist;
NSMutableArray *newlist;


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
    
    //self.lab1.layer.radius = 6;
    lab1.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed: @"button (16).png"]];
    lab2.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed: @"button (16).png"]];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}



- (IBAction)submitBut:(id)sender {
    
    
    if(one&&two&&![in1.text isEqualToString:@""]&&![in2.text isEqualToString:@""]){
        NSString *acro = in1.text;
        NSString *acrodef = in2.text;
        PFQuery *query = [PFQuery queryWithClassName:@"Acronym"];
        [query whereKey:@"acro" equalTo:acro];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objectss, NSError *error) {
            if (!error) {
                if ([objectss count]>0){
                    PFObject *exists = objectss[0];
                    NSMutableArray *defblock = [exists objectForKey:@"def"];
                    NSMutableArray *detblock = [exists objectForKey:@"detail"];
                    [defblock addObject:acrodef];
                    [detblock addObject:@""];
                    [exists setObject:defblock forKey:@"def"];
                    [exists addObject:detblock forKey:@"detail"];
                    [exists saveInBackground];
                }
                else{
                    PFObject *new=[PFObject objectWithClassName:@"Acronym"];
                    NSMutableArray *defblock = [NSMutableArray arrayWithObject:acrodef];
                    NSMutableArray *detblock = [NSMutableArray arrayWithObject:@""];
                    [new setObject:defblock forKey:@"def"];
                    [new setObject:detblock forKey:@"detail"];
                    [new setObject:acro forKey:@"acro"];
                    [new saveInBackground];
                   // [acronymlist addObject:new];
                }
                
            }
            else {
                
                NSLog(@"Error: %@ %@", error, [error userInfo]);
                
            }
        }];
        one=false;
        two=false;
        
        
        NSTimer *t = [NSTimer scheduledTimerWithTimeInterval: 2.0
                                                      target: self
                                                    selector:@selector(onTick)
                                                    userInfo: nil repeats:YES];

    
    }
    
    
}

- (void)populateAcro{
    PFQuery *query1 = [PFQuery queryWithClassName:@"Acronym"];
    query1.limit = 1000;
    query1.cachePolicy =kPFCachePolicyNetworkElseCache;
    [query1 findObjectsInBackgroundWithBlock:^(NSArray *objectss, NSError *error) {
        if (!error) {
            tmp1 = [objectss copy];
            NSMutableSet *set = [NSMutableSet setWithArray:tmp1];
            [set addObjectsFromArray:tmp2];
            NSArray *array = [set allObjects];
            newlist = [array copy];
            
        }
        else {
            
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            
        }
    }];
    
    PFQuery *query2 = [PFQuery queryWithClassName:@"Acronym"];
    query2.skip = 1000;
    query2.limit = 1000;
    query2.cachePolicy =kPFCachePolicyNetworkElseCache;
    [query2 findObjectsInBackgroundWithBlock:^(NSArray *objectss, NSError *error) {
        if (!error) {
            
            tmp2 = [objectss copy];
            
            
        }
        else {
            
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

-(void)onTick{
    int population =[newlist count];
    if (population==0) {
        [self populateAcro];
    }
    
    if (population>1000){
        acronymlist=[newlist copy];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (IBAction)acro:(id)sender {
    one=true;
    
}

- (IBAction)acrodef:(id)sender {
    two=true;
}

@end
