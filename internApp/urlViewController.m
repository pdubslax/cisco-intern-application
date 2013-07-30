//
//  urlViewController.m
//  internApp
//
//  Created by Patrick James Wilson on 6/24/13.
//  Copyright (c) 2013 Patrick James Wilson. All rights reserved.
//

#import "urlViewController.h"

@interface urlViewController ()

@end

@implementation urlViewController
@synthesize button0,button1,button2,button3,button4,button5,button6,focus,text,image,frame1,frame2,frame3,frame4,frame5,frame6,vpname;

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
    focus=button0;
    
 self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    frame1 = [button1 frame];
    frame2 = [button2 frame];
    frame3 = [button3 frame];
    frame4 = [button4 frame];
    frame5 = [button5 frame];
    frame6 = [button6 frame];
    vpname.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed: @"button (20).png"]];
    [vpname setText:@"Shella Jordan"];
    [image setImage:[UIImage imageNamed:@"pic0.png"]];
    [button0 setTitle:@"Communication and Collaboration IT" forState:UIControlStateNormal];
    
   
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animate:(UIButton*)but1 swap:(UIButton*)but2
{
    
    CGRect test2=[focus frame];
    
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSArray *vp = [dic objectForKey:@"vp"];
    NSArray *name = [dic objectForKey:@"deptname"];
    NSArray *acro = [dic objectForKey:@"acro"];
    NSArray *vppix = [dic objectForKey:@"pix"];
    NSArray *descrip = [dic objectForKey:@"descrip"];
    
    [but2 setTitle:acro[but2.tag] forState:UIControlStateNormal];
    [but1 setTitle:name[but1.tag] forState:UIControlStateNormal];
    
    
    
    
    [UIView transitionWithView:but2
                      duration:0.5f
                       options:UIViewAnimationOptionCurveEaseInOut
                    animations:^(void) {
                        [but1 setFrame:test2];
                        switch (but1.tag) {
                            case 0:
                                [button1 setFrame:frame1];
                                [button2 setFrame:frame2];
                                [button3 setFrame:frame3];
                                [button4 setFrame:frame4];
                                [button5 setFrame:frame5];
                                [button6 setFrame:frame6];
                                break;
                            case 1:
                                [button0 setFrame:frame1];
                                [button2 setFrame:frame2];
                                [button3 setFrame:frame3];
                                [button4 setFrame:frame4];
                                [button5 setFrame:frame5];
                                [button6 setFrame:frame6];
                                break;
                            case 2:
                                [button0 setFrame:frame1];
                                [button1 setFrame:frame2];
                                [button3 setFrame:frame3];
                                [button4 setFrame:frame4];
                                [button5 setFrame:frame5];
                                [button6 setFrame:frame6];
                                break;
                            case 3:
                                [button0 setFrame:frame1];
                                [button1 setFrame:frame2];
                                [button2 setFrame:frame3];
                                [button4 setFrame:frame4];
                                [button5 setFrame:frame5];
                                [button6 setFrame:frame6];
                                break;
                            case 4:
                                [button0 setFrame:frame1];
                                [button1 setFrame:frame2];
                                [button2 setFrame:frame3];
                                [button3 setFrame:frame4];
                                [button5 setFrame:frame5];
                                [button6 setFrame:frame6];
                                break;
                            case 5:
                                [button0 setFrame:frame1];
                                [button1 setFrame:frame2];
                                [button2 setFrame:frame3];
                                [button3 setFrame:frame4];
                                [button4 setFrame:frame5];
                                [button6 setFrame:frame6];
                                break;
                            case 6:
                                [button0 setFrame:frame1];
                                [button1 setFrame:frame2];
                                [button2 setFrame:frame3];
                                [button3 setFrame:frame4];
                                [button4 setFrame:frame5];
                                [button5 setFrame:frame6];
                                break;
                            default:
                                break;
                                
                                
                        }
                       
                        [vpname setText:vp[but1.tag]];
                        [image setImage:[UIImage imageNamed: vppix[but1.tag]]];
                        [text setText:descrip[but1.tag]];
                        
                    }
                    completion:^(BOOL finished) {
                        
                    }];
    focus=but1;
    
    

    
    
}

- (IBAction)button0:(id)sender {
    NSArray *hey = [NSArray arrayWithObjects:button0,button1,button2,button3,button4,button5,button6, nil];
    UIButton *boom = hey[[sender tag]];
    [self animate:boom swap:focus];
}




@end
