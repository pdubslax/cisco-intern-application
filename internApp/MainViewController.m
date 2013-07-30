//
//  MainViewController.m
//  internApp
//
//  Created by Patrick James Wilson on 6/25/13.
//  Copyright (c) 2013 Patrick James Wilson. All rights reserved.
//

#import "MainViewController.h"
#import "ciscoBreakdownViewController.h"
#import <Parse/Parse.h>

@interface MainViewController ()

@end

NSMutableArray* acronymlist;
NSMutableArray *tmp1;
NSMutableArray *tmp2;
BOOL go;

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
            acronymlist = [array copy];
            
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

- (void)viewDidLoad
{
    //UINavigationController *navigationController;
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    go =false;
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    [self populateAcro];
    
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UIViewController* vc = [sb instantiateViewControllerWithIdentifier:@"splash"];
    [self presentViewController:vc animated:NO completion:nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ciscobreakdown:(id)sender {
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Storyboard2" bundle:nil];
    UIViewController* vc = [sb instantiateViewControllerWithIdentifier:@"cisco123"];
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
