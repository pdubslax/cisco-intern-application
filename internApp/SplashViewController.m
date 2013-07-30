//
//  SplashViewController.m
//  internApp
//
//  Created by Patrick James Wilson on 7/8/13.
//  Copyright (c) 2013 Patrick James Wilson. All rights reserved.
//

#import "SplashViewController.h"
#import "MainViewController.h"
@interface SplashViewController ()

@end

@implementation SplashViewController
BOOL go;
NSMutableArray* acronymlist;


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
    
    NSTimer *t = [NSTimer scheduledTimerWithTimeInterval: 1.0
                                                  target: self
                                                selector:@selector(onTick)
                                                userInfo: nil repeats:YES];
   
    
	// Do any additional setup after loading the view.
}

-(void)onTick{
    int population =[acronymlist count];
    if (population>1000){
        [self dismissViewControllerAnimated:NO completion:nil];
    }
    //[UIView commitAnimations];
    
    
    //[self dismissViewControllerAnimated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
