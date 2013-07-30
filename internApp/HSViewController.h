//
//  HSViewController.h
//  internApp
//
//  Created by Patrick Wilson on 7/24/13.
//  Copyright (c) 2013 Patrick James Wilson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray *highScoreArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
