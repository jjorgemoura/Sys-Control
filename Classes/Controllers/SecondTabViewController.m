    //
//  SecondTabViewController.m
//  iUZStatus
//
//  Created by Jorge Moura on 8/7/10.
//  Copyright 2010 iUZ. All rights reserved.
//

#import "SecondTabViewController.h"


@implementation SecondTabViewController

@synthesize locationManager;


#pragma mark -
#pragma mark Initialization
-(id) initWithTabBar {
	
	if ([self init]) {
		
		//this is the label on the tab button itself
		self.title = @"LBS";
		
		//use whatever image you want and add it to your project
		self.tabBarItem.image = [UIImage imageNamed:@"73-radar.png"];
		
		// set the long name shown in the navigation bar at the top
		self.navigationItem.title=@"LBS";
	}
	
	return self;
}


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    
    // creating a new view to push in
	[self setView: [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]]   ]; 

    
    //Define BackgroudColor
    [[self view ] setBackgroundColor:[UIColor lightGrayColor]];
    
    
    //GPS
    locationManager = [[CLLocationManager alloc] init];
	locationManager.delegate = self;
	locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
	locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
	[locationManager startUpdatingLocation];
    
    
    
    
    
    
    UILabel *myLabelGPS = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 200, 20)];
    myLabelGPS.backgroundColor = [UIColor lightGrayColor];
    myLabelGPS.text = @"GPS";
    
    
    //GPS X:
    UILabel *myLabelGPSX = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 50, 20)];
    myLabelGPSX.backgroundColor = [UIColor lightGrayColor];
    myLabelGPSX.text = @"X: ";
    
    UILabel *myLabelGPSXValue = [[UILabel alloc] initWithFrame:CGRectMake(50, 170, 200, 20)];
    myLabelGPSXValue.text = @"...";
    myLabelGPSXValue.backgroundColor = [UIColor lightGrayColor];
    myLabelGPSXValue.tag = 1;
    
    
    //GPS Y:
    UILabel *myLabelGPSY = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 50, 20)];
    myLabelGPSY.backgroundColor = [UIColor lightGrayColor];
    myLabelGPSY.text = @"Y: ";
    
    
    UILabel *myLabelGPSYValue = [[UILabel alloc] initWithFrame:CGRectMake(50, 220, 200, 20)];
    myLabelGPSYValue.text = @"...";
    myLabelGPSYValue.backgroundColor = [UIColor lightGrayColor];
    myLabelGPSYValue.tag = 2;
    
    
    
    [self.view addSubview:myLabelGPS];
    [self.view addSubview:myLabelGPSX];
    [self.view addSubview:myLabelGPSXValue];
    [self.view addSubview:myLabelGPSY];
    [self.view addSubview:myLabelGPSYValue];
    
    [myLabelGPS release];
    [myLabelGPSX release];
    [myLabelGPSXValue release];
    [myLabelGPSY release];
    [myLabelGPSYValue release];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/




- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
	int degrees = newLocation.coordinate.latitude;
	double decimal = fabs(newLocation.coordinate.latitude - degrees);
	int minutes = decimal * 60;
	double seconds = decimal * 3600 - minutes * 60;
	NSString *lat = [NSString stringWithFormat:@"%d° %d' %1.4f\"", degrees, minutes, seconds];
	NSLog(@"Latitude: %@", lat);    
	//latLabel.text = lat;
	
	degrees = newLocation.coordinate.longitude;
	decimal = fabs(newLocation.coordinate.longitude - degrees);
	minutes = decimal * 60;
	seconds = decimal * 3600 - minutes * 60;
    
	NSString *longt = [NSString stringWithFormat:@"%d° %d' %1.4f\"", degrees, minutes, seconds];
	NSLog(@"Longitude: %@", longt);
	//longLabel.text = longt;
    
    //GPS X:
    UILabel *lbltemp1 = (UILabel*)[self.view viewWithTag:1];
    lbltemp1.text = lat;
    
    
    //GPS Y:
    UILabel *lbltemp2 = (UILabel*)[self.view viewWithTag:2];
    lbltemp2.text = longt;
}






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
    
    [locationManager release];
    
    [super dealloc];
}


@end
