//
//  ViewControllerAcroDetail.m
//  internApp
//
//  Created by Patrick James Wilson on 6/17/13.
//  Copyright (c) 2013 Patrick James Wilson. All rights reserved.
//

#import "ViewControllerAcroDetail.h"

@interface ViewControllerAcroDetail ()

@end

NSMutableArray *acronymlist;

@implementation ViewControllerAcroDetail
@synthesize myLabel;
@synthesize myLabel2;
@synthesize myLabel3;
@synthesize myLabel4;
@synthesize yolo;



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
    NSString *arbv = [yolo objectForKey:@"acro"];
    NSArray *arbv2 = [yolo objectForKey:@"def"];
    NSArray *arbv3 = [yolo objectForKey:@"detail"];
    NSString *test = @"test";
    
    myLabel.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed: @"button (15).png"]];
     myLabel2.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed: @"button (14).png"]];
     myLabel3.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed: @"button (14).png"]];
     myLabel4.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed: @"button (14).png"]];
    
    
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    
    myLabel.text=arbv;
    if ([arbv2 count]==2){
        myLabel2.text=arbv2[0];
        myLabel3.text=arbv2[1];
        [myLabel4 setAlpha:0.0];
        [self fixFont:test withLabel:myLabel2 withum:0];
        [self fixFont:test withLabel:myLabel3 withum:1];
        
    }
    else if([arbv2 count]==3){
       
        myLabel2.text=arbv2[0];
        myLabel3.text=arbv2[1];
        myLabel4.text=arbv2[2];
        [self fixFont:test withLabel:myLabel2 withum:0];
        [self fixFont:test withLabel:myLabel3 withum:1];
        [self fixFont:test withLabel:myLabel4 withum:2];
    }
    else{
        myLabel2.text=arbv2[0];
        [self fixFont:test withLabel:myLabel2 withum:0];
        [myLabel3 setAlpha:0.0];
        [myLabel4 setAlpha:0.0];
    }
    
    
    
    
    
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)fixFont:(NSString *)test withLabel:(UILabel *)yee withum:(int)swag{
    NSString *theText = [yolo objectForKey:@"des"][swag];
    CGRect labelRect = CGRectFromString(test);
    yee.adjustsFontSizeToFitWidth = NO;
    yee.numberOfLines = 0;
    
    CGFloat fontSize = 30;
    while (fontSize > 0.0)
    {
        CGSize size = [theText sizeWithFont:[UIFont fontWithName:@"System" size:fontSize] constrainedToSize:CGSizeMake(labelRect.size.width, 10000)];
        
        if (size.height <= labelRect.size.height) break;
        
        fontSize -= 1.0;
    }
    
    //set font size
    yee.font = [UIFont fontWithName:@"System" size:fontSize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
