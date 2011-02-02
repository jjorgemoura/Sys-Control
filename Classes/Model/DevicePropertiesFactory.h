//
//  DevicePropertiesFactory.h
//  ZendonStatus
//
//  Created by Jorge Moura on 6/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DevicePropertiesFactory : NSObject {

	//NSDictionary *devicePropertiesList;
}

+(NSDictionary *)fillDeviceProperties;

+(NSString *)zdDeviceModel;
+(NSString *)zdDeviceVersion;
+(NSString *)zdSerialNumber;
+(NSString *)zdImei;
+(NSString *)zdExternalIP;
+(NSString *)zdWiFiNetwork;
+(NSString *)zdWiFiMac;
+(NSString *)zdCarrier;
+(NSString *)zdProcessor;
+(NSString *)zdCapacity;
+(NSString *)zdAvailable;
+(NSString *)zdSongNumber;

@end
