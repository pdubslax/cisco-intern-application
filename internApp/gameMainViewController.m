//
//  gameMainViewController.m
//  internApp
//
//  Created by Patrick James Wilson on 6/26/13.
//  Copyright (c) 2013 Patrick James Wilson. All rights reserved.
//

#import "gameMainViewController.h"
#import <Parse/Parse.h>
#import <QuartzCore/QuartzCore.h>
#import "HSViewController.h"


@interface gameMainViewController ()

@end

@implementation gameMainViewController
NSMutableArray *highScoreArray;

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
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self populateHS];
	// Do any additional setup after loading the view.
    
    
}

- (void)populateHS{
    PFQuery *query1 = [PFQuery queryWithClassName:@"highScore"];
    query1.limit = 1000;
    query1.cachePolicy =kPFCachePolicyNetworkElseCache;
    [query1 findObjectsInBackgroundWithBlock:^(NSArray *objectss, NSError *error) {
        if (!error) {
            
            highScoreArray = [objectss copy];
           
            
            /*
            NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"score" ascending:NO];
            NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
            NSArray *sortedArray = [highScoreArray sortedArrayUsingDescriptors:sortDescriptors];
            highScoreArray = [sortedArray copy];
            
             
            
            
             NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"score" ascending:NO];
             
             
             */
            /*
            [highScoreArray sortUsingComparator:^NSComparisonResult(id str1, id str2) {
                return [[str1 objectForKey:@"score"] compare:[str2 objectForKey:@"score"] options:nil];
            }];
            */
            
            NSSortDescriptor *scoreDescriptor = [[NSSortDescriptor alloc] initWithKey:@"score" ascending:NO comparator:^(id obj1, id obj2){
                if ([obj1 integerValue] > [obj2 integerValue]) {
                    return (NSComparisonResult)NSOrderedDescending;
                }
                if ([obj1 integerValue] < [obj2 integerValue]) {
                    return (NSComparisonResult)NSOrderedAscending;
                }
                return (NSComparisonResult)NSOrderedSame;
            }];
            NSArray *sortDescriptors = @[scoreDescriptor];
            NSArray *sortedArray = [highScoreArray sortedArrayUsingDescriptors:sortDescriptors];
            highScoreArray = [sortedArray copy];
            
           

            
            NSLog(@"%@", highScoreArray);
        }
        else {
            
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            
        }
    }];
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)beginGame:(id)sender {
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Storyboard2" bundle:nil];
    gameMainViewController* vc = [sb instantiateViewControllerWithIdentifier:@"gameEngine"];
    vc.navigationItem.hidesBackButton=YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)highScores:(id)sender {
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    HSViewController* vc = [sb instantiateViewControllerWithIdentifier:@"highScoreTable"];
    vc.highScoreArray = highScoreArray;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
