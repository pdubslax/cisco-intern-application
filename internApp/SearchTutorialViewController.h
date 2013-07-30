//
//  SearchTutorialViewController.h
//  internApp
//
//  Created by Patrick James Wilson on 6/17/13.
//  Copyright (c) 2013 Patrick James Wilson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerAcroDetail.h"

@interface SearchTutorialViewController : UIViewController <UISearchDisplayDelegate, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate> {
    NSArray *listItems;
    NSMutableArray *filteredListItems;
    
    NSString *savedSearchTerm;
    NSInteger savedScopeButtonIndex;
    BOOL searchWasActive;
    
    IBOutlet UITableView *tableView;

}

@property (nonatomic, retain) NSArray *listItems;
@property (nonatomic, retain) NSMutableArray *filteredListItems;

@property (nonatomic, copy) NSString *savedSearchTerm;
@property (nonatomic) NSInteger savedScopeButtonIndex;
@property (nonatomic) BOOL searchWasActive;


@end

