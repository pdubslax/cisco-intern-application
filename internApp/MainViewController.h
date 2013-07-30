//
//  MainViewController.h
//  internApp
//
//  Created by Patrick James Wilson on 6/25/13.
//  Copyright (c) 2013 Patrick James Wilson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *button0;

@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
- (IBAction)ciscobreakdown:(id)sender;

extern NSMutableArray* acronymlist;
extern BOOL go;



@end
