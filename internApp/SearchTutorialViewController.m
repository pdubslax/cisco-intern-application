//
//  SearchTutorialViewController.m
//  internApp
//
//  Created by Patrick James Wilson on 6/17/13.
//  Copyright (c) 2013 Patrick James Wilson. All rights reserved.
//

#import "SearchTutorialViewController.h"
#import <Parse/Parse.h>
#import <QuartzCore/QuartzCore.h>

@implementation SearchTutorialViewController

NSMutableArray *acronymlist;

@synthesize listItems, filteredListItems, savedSearchTerm, savedScopeButtonIndex, searchWasActive;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    ViewControllerAcroDetail* vc = [sb instantiateViewControllerWithIdentifier:@"ViewControllerAcroDetail"];
    if ([filteredListItems count]>0){
        vc.yolo=[filteredListItems objectAtIndex:indexPath.row];
    }
    else{
        vc.yolo=[listItems objectAtIndex:indexPath.row];
    }
    
    [self.navigationController pushViewController:vc animated:YES];

}


- (void)viewDidLoad
{
    
    [tableView reloadData];
    [tableView setNeedsDisplay];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    
   
    
    
    listItems = [acronymlist copy];
  
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"acro" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [listItems sortedArrayUsingDescriptors:sortDescriptors];
    listItems = sortedArray;
    //NSLog(@"%@", listItems);
    
    
    // create a filtered list that will contain products for the search results table.
	self.filteredListItems = [NSMutableArray arrayWithCapacity:[self.listItems count]];
    //filteredListItems=listItems;
    
    
    
    
	
	// restore search settings if they were saved in didReceiveMemoryWarning.
    if (self.savedSearchTerm)
	{
        [self.searchDisplayController setActive:self.searchWasActive];
        [self.searchDisplayController.searchBar setSelectedScopeButtonIndex:self.savedScopeButtonIndex];
        [self.searchDisplayController.searchBar setText:savedSearchTerm];
       
        
        self.savedSearchTerm = nil;
    }
    

    
    
    
	tableView.scrollEnabled = YES;
    
    //self.navigationController.navigationBar.tintColor = [UIColor blueColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //tableView.backgroundColor = [UIColor blackColor];
   
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}





- (NSInteger)tableView:(UITableView *)acroview numberOfRowsInSection:(NSInteger)section {
    if (acroview == self.searchDisplayController.searchResultsTableView){
        return [self.filteredListItems count];
        
    }
	else{
        return [self.listItems count];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)acroview cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSString *acrostring;
    
    if (acroview == self.searchDisplayController.searchResultsTableView){
        acrostring = [filteredListItems[indexPath.row] objectForKey:@"acro"];
    }else {
        acrostring = [listItems[indexPath.row] objectForKey:@"acro"];
    }
     
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:acrostring];
        /*
    [cell.selectedBackgroundView setBackgroundColor:[UIColor blueColor]];
    [cell.backgroundView setBackgroundColor:[UIColor greenColor]];
    */
    
    //tableView.backgroundColor = [UIColor blackColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [cell setBackgroundColor:[UIColor colorWithPatternImage: [UIImage imageNamed: @"button (12).png"]]];
    
    
    UIView *selectionColor = [[UIView alloc] init];
    selectionColor.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed: @"button (13).png"]];
    cell.selectedBackgroundView = selectionColor;
    cell.textLabel.highlightedTextColor = [UIColor blackColor];
    
        
    
    
    
    
    /*
    
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = cell.bounds;
        gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor]CGColor], (id)[[UIColor grayColor]CGColor], nil];
        
        [cell.layer insertSublayer:gradient atIndex:0];
    
    */
    
    
    

}


- (void)viewDidUnload
{
    self.filteredListItems = nil;
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
   
    [super viewWillAppear:animated];
    [tableView reloadData];
    [tableView setNeedsDisplay];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [tableView reloadData];
    [tableView setNeedsDisplay];
	
    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self->tableView deselectRowAtIndexPath:[self->tableView indexPathForSelectedRow] animated:animated];
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{	
	[filteredListItems removeAllObjects]; // First clear the filtered array.

    
    
	for (NSDictionary *item in listItems)
	{
        //NSLog(@"Searching for %@ in %@ using \"%@\"",searchText,scope,[item objectForKey:@"title"]);
		if ([scope isEqualToString:@"All"] || [[item objectForKey:@"acro"]  isEqualToString:scope] || scope == nil)
		{
			NSComparisonResult result = [[item objectForKey:@"acro"] compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
            
            if (result == NSOrderedSame)
			{
				[filteredListItems addObject:item];
            }
		}
	}

}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    //[controller.searchResultsTableView setBackgroundColor:[UIColor scrollViewTexturedBackgroundColor]];
    [controller.searchResultsTableView setBackgroundColor:[UIColor blackColor]];
    [controller.searchResultsTableView setSeparatorColor:[UIColor blackColor]];
    [controller.searchResultsTableView setBounces:NO];
    /*
    UIImage *patternImage = [UIImage imageNamed:@"Wavy-Blue-Background-Vector-Graphic.jpg"];
    [controller.searchResultsTableView setBackgroundColor:[UIColor colorWithPatternImage: patternImage]];
    */
    
    
    
    /*
    [controller.searchResultsTableView setBackgroundColor:[UIColor colorWithRed:0.31 green:0.941 blue:0.522 alpha:1] ];
    [controller.searchResultsTableView setSeparatorColor:[UIColor blackColor]];
    */
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(void) searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self viewDidLoad];
}




@end
