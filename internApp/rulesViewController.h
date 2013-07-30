//
//  rulesViewController.h
//  internApp
//
//  Created by Patrick James Wilson on 6/26/13.
//  Copyright (c) 2013 Patrick James Wilson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rulesViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
- (IBAction)button:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *text;
- (IBAction)addName:(id)sender;
- (IBAction)menu:(id)sender;



@end
