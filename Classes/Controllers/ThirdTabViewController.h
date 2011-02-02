//
//  ThirdTabViewController.h
//  iUZStatus
//
//  Created by Jorge Moura on 8/7/10.
//  Copyright 2010 iUZ. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ThirdTabViewController : UIViewController<UIAccelerometerDelegate> {

    
    IBOutlet UIProgressView *progressX;
    IBOutlet UIProgressView *progressY;
    IBOutlet UIProgressView *progressZ;
    
    IBOutlet UILabel *labelX;
    IBOutlet UILabel *labelY;
    IBOutlet UILabel *labelZ;
    
    UIAccelerometer *accelerometer;
}


@property (nonatomic, retain) IBOutlet UIProgressView *progressX;
@property (nonatomic, retain) IBOutlet UIProgressView *progressY;
@property (nonatomic, retain) IBOutlet UIProgressView *progressZ;

@property (nonatomic, retain) IBOutlet UILabel *labelX;
@property (nonatomic, retain) IBOutlet UILabel *labelY;
@property (nonatomic, retain) IBOutlet UILabel *labelZ;

@property (nonatomic, retain) UIAccelerometer *accelerometer;

@end
