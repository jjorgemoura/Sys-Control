    //
//  ThirdTabViewController.m
//  iUZStatus
//
//  Created by Jorge Moura on 8/7/10.
//  Copyright 2010 iUZ. All rights reserved.
//

#import "ThirdTabViewController.h"


@implementation ThirdTabViewController


@synthesize progressX;
@synthesize progressY;
@synthesize progressZ;

@synthesize labelX;
@synthesize labelY;
@synthesize labelZ;

@synthesize accelerometer;



#pragma mark -
#pragma mark Initialization
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
 
        //this is the label on the tab button itself
		self.title = @"Accelerometer";
		
		//use whatever image you want and add it to your project
		self.tabBarItem.image = [UIImage imageNamed:@"81-dashboard.png"];
		
		// set the long name shown in the navigation bar at the top
		self.navigationItem.title=@"Accelerometer";
    }
    
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    [self setAccelerometer:[UIAccelerometer sharedAccelerometer]];
    [[self accelerometer] setUpdateInterval: .1];
    [[self accelerometer] setDelegate:self];
    
//    self.accelerometer = [UIAccelerometer sharedAccelerometer];
//    self.accelerometer.updateInterval = .1;
//    self.accelerometer.delegate = self;
    
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/



#pragma mark -
#pragma mark Acellerometer Delegate Methods
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
	
	
	NSLog(@"Chamada do method do delegate do accelerometer");
	
	NSLog(@"Valor X: %i", [acceleration x]);
	NSLog(@"Valor Y: %i", [acceleration y]);
	NSLog(@"Valor Z: %i", [acceleration z]);
	NSLog(@"Valor timestamp: %i", [acceleration timestamp]);
    
    
    [[self labelX] setText:[NSString stringWithFormat:@"%@%f", @"X: ", [acceleration x]]];
    [[self labelY] setText:[NSString stringWithFormat:@"%@%f", @"Y: ", [acceleration y]]];
    [[self labelZ] setText:[NSString stringWithFormat:@"%@%f", @"Z: ", [acceleration z]]];
    
    
    
    [[self progressX] setProgress:ABS([acceleration x])];
    [[self progressY] setProgress:ABS([acceleration y])];
    [[self progressZ] setProgress:ABS([acceleration z])];
	
}


#pragma mark -
#pragma mark Memory management
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    
    [progressX release];
    [progressY release];
    [progressZ release];
    
    [labelX release];
    [labelY release];
    [labelZ release];
    
    [accelerometer release];
    
    [super dealloc];
}


@end
