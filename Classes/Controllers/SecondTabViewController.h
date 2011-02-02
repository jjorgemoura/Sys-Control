//
//  SecondTabViewController.h
//  iUZStatus
//
//  Created by Jorge Moura on 8/7/10.
//  Copyright 2010 iUZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface SecondTabViewController : UIViewController<CLLocationManagerDelegate> {

    CLLocationManager *locationManager;
}

-(id)initWithTabBar;



@property (nonatomic, retain) CLLocationManager *locationManager;

@end
