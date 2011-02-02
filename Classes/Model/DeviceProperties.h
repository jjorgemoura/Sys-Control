//
//  DeviceProperties.h
//  ZendonStatus
//
//  Created by Jorge Moura on 6/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DeviceProperties : NSObject {

	int propertyID;
	NSString *propertyName;
	NSString *propertyType;
    NSString *propertyValue;
}

@property (readwrite) int propertyID;
@property (nonatomic, retain) NSString *propertyName;
@property (nonatomic, retain) NSString *propertyType;
@property (nonatomic, retain) NSString *propertyValue;

@end
