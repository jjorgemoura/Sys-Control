//
//  FirstTabViewController.m
//  iUZStatus
//
//  Created by Jorge Moura on 8/7/10.
//  Copyright 2010 iUZ. All rights reserved.
//

#import "FirstTabViewController.h"

#import "DevicePropertiesFactory.h"
#import "DeviceProperties.h"


@implementation FirstTabViewController

@synthesize tableParameters;


#pragma mark -
#pragma mark Initialization

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if ((self = [super initWithStyle:style])) {
    }
    return self;
}
*/

-(id) initWithTabBar {
	
	if ([self initWithStyle:UITableViewStyleGrouped]) {
		
		//this is the label on the tab button itself
		self.title = @"Device Info";
		
		//use whatever image you want and add it to your project
		self.tabBarItem.image = [UIImage imageNamed:@"32-iphone.png"];
		
		// set the long name shown in the navigation bar at the top
		self.navigationItem.title=@"Device Info";
		
		//Dizer que o source desta table e o array.
		NSDictionary *tempDic = [DevicePropertiesFactory fillDeviceProperties];
		
		self.tableParameters = tempDic;
		[tempDic release];
		
		[self.tableParameters retain];
		NSLog(@"Num retains do dic: %i", [self.tableParameters retainCount]);
		
		
		
		[self.tableView setDataSource:self];
		//[self.tableView reloadData];
	}
	
	return self;
}



#pragma mark -
#pragma mark View lifecycle

/*
- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
*/

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
	// Return the number of sections.
    
	NSLog(@"Num Sections: %i", [self.tableParameters count]);
	//NSLog(@"Num Sections: %i", [[tableParameters allKeys] count]);
	
    return [self.tableParameters count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
	// Return the number of rows in the section.
    
	//NSLog(@"Section ID = %i", section);
	NSString *keySection;
	
	if(section == 0) {
		
		//NSLog(@"Device");
		keySection = @"Device";
	}
	
	if(section == 1) {
		
		//NSLog(@"Network");
		keySection = @"Network";
	}
	
	if(section == 2) {
		
		//NSLog(@"Other");
		keySection = @"Other";
	}
	
	
	//[[tableParameters objectForKey:keySection] count];
	//NSArray *tempArray = [tableParameters objectForKey:keySection];
	//NSLog(@"Numero de Elementos do array: %i", [tempArray count]);
	//NSLog(@"Numero de Elementos do array: %i", [[self.tableParameters objectForKey:keySection] count]);
	
    return [[self.tableParameters objectForKey:keySection] count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
	
	NSUInteger section = [indexPath section];
	NSUInteger row = [indexPath row];
	
	
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    //NSLog(@"Index Path e: %i", indexPath);
	NSLog(@"Section: %i", section);
	NSLog(@"Row: %i", row);
	
	
	NSString *key;
	
	if(section == 0) {
		
		//NSLog(@"Device");
		key = @"Device";
	}
	
	if(section == 1) {
		
		//NSLog(@"Network");
		key = @"Network";
	}
	
	if(section == 2) {
		
		//NSLog(@"Other");
		key = @"Other";
	}
	
	
	
	//NSLog(@"o dic: %@", self.tableParameters);
	//NSLog(@"Numero de Elementos do dic: %i", [self.tableParameters count]);
	//NSArray *tempArray = [self.tableParameters objectForKey:key];
	//NSLog(@"Numero de Elementos do array: %i", [tempArray count]);
	NSLog(@"Num retains do dic: %i", [self.tableParameters retainCount]);
	
	
	DeviceProperties *dp = [[self.tableParameters objectForKey:key] objectAtIndex:row];
	
    cell.textLabel.text = dp.propertyName; // [self.tableParameters objectAtIndex:row];
    //cell.textLabel.text = [NSString stringWithFormat:@"%@        %@", dp.propertyName, dp.propertyValue ]; 
    cell.detailTextLabel.text = dp.propertyValue;
	
	
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	if(section == 0) {
		
		//NSLog(@"Device");
		return @"Device";
	}
	
	if(section == 1) {
		
		//NSLog(@"Network");
		return @"Network";
	}
	
	if(section == 2) {
		
		//NSLog(@"Other");
		return @"Other";
	}
	
	return @"iUZ ...";
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return UITableViewCellEditingStyleNone;
}



#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {

    // Releases the view if it doesn't have a superview.
	NSLog(@"Recebi aviso de memoria");
    
	[super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
	
	self.tableParameters = nil;
	
	NSLog(@"Recebi aviso View did Unload");
}


- (void)dealloc {
	
	NSLog(@"Vamos fazer dealloc ao DeviceInfoController");
	
	[self.tableParameters release];
    [super dealloc];
}
@end

