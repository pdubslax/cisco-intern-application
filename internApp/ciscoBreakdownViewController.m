//
//  ciscoBreakdownViewController.m
//  internApp
//
//  Created by Patrick James Wilson on 7/9/13.
//  Copyright (c) 2013 Patrick James Wilson. All rights reserved.
//

#import "ciscoBreakdownViewController.h"

@interface ciscoBreakdownViewController ()

@end

@implementation ciscoBreakdownViewController

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
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
