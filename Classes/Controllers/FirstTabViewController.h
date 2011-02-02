//
//  FirstTabViewController.h
//  iUZStatus
//
//  Created by Jorge Moura on 8/7/10.
//  Copyright 2010 iUZ. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstTabViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource> {

	NSDictionary *tableParameters;
	
}


-(id)initWithTabBar;


@property (nonatomic, retain) NSDictionary *tableParameters;

@end
