//
//  DevicePropertiesFactory.m
//  ZendonStatus
//
//  Created by Jorge Moura on 6/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DevicePropertiesFactory.h"

#import "DeviceProperties.h"


@implementation DevicePropertiesFactory


+(NSDictionary *)fillDeviceProperties{
	
	DeviceProperties *dp1 = [[DeviceProperties alloc] init];
	DeviceProperties *dp2 = [[DeviceProperties alloc] init];
	DeviceProperties *dp3 = [[DeviceProperties alloc] init];
	DeviceProperties *dp4 = [[DeviceProperties alloc] init];
	DeviceProperties *dp5 = [[DeviceProperties alloc] init];
	DeviceProperties *dp6 = [[DeviceProperties alloc] init];
	DeviceProperties *dp7 = [[DeviceProperties alloc] init];
	DeviceProperties *dp8 = [[DeviceProperties alloc] init];
	DeviceProperties *dp9 = [[DeviceProperties alloc] init];
	DeviceProperties *dp10 = [[DeviceProperties alloc] init];
	DeviceProperties *dp11 = [[DeviceProperties alloc] init];
	DeviceProperties *dp12 = [[DeviceProperties alloc] init];
	
	dp1.propertyID = 1;
	dp1.propertyName = @"Model";
	dp1.propertyType = @"String";
    dp1.propertyValue = [DevicePropertiesFactory zdDeviceModel];
	
	dp2.propertyID = 2;
	dp2.propertyName = @"Version";
	dp2.propertyType = @"String";
    dp2.propertyValue = [DevicePropertiesFactory zdDeviceVersion];

	dp3.propertyID = 3;
	dp3.propertyName = @"Serial Number";
	dp3.propertyType = @"String";
    dp3.propertyValue = [DevicePropertiesFactory zdSerialNumber];
	
	dp4.propertyID = 4;
	dp4.propertyName = @"IMEI";
	dp4.propertyType = @"String";
    dp4.propertyValue = [DevicePropertiesFactory zdImei];
	
	dp5.propertyID = 5;
	dp5.propertyName = @"IP External";
	dp5.propertyType = @"String";
    dp5.propertyValue = [DevicePropertiesFactory zdExternalIP];
	
	dp6.propertyID = 6;
	dp6.propertyName = @"WiFi";
	dp6.propertyType = @"String";
    dp6.propertyValue = [DevicePropertiesFactory zdWiFiNetwork];
	
	dp7.propertyID = 7;
	dp7.propertyName = @"Wi-Fi Mac";
	dp7.propertyType = @"String";
    dp7.propertyValue = [DevicePropertiesFactory zdWiFiMac];
	
	dp8.propertyID = 8;
	dp8.propertyName = @"Carrier";
	dp8.propertyType = @"String";
    dp8.propertyValue = [DevicePropertiesFactory zdCarrier];
	
	dp9.propertyID = 9;
	dp9.propertyName = @"Processor";
	dp9.propertyType = @"String";
    dp9.propertyValue = [DevicePropertiesFactory zdProcessor];
	
	dp10.propertyID = 10;
	dp10.propertyName = @"Capacity";
	dp10.propertyType = @"String";
    dp10.propertyValue = [DevicePropertiesFactory zdCapacity];
	
	dp11.propertyID = 11;
	dp11.propertyName = @"Available";
	dp11.propertyType = @"String";
    dp11.propertyValue = [DevicePropertiesFactory zdAvailable];
	
	dp12.propertyID = 12;
	dp12.propertyName = @"Songs";
	dp12.propertyType = @"String";
    dp12.propertyValue = [DevicePropertiesFactory zdSongNumber];
	
	NSArray *section1 = [NSArray arrayWithObjects:dp1, dp2, dp3, dp4, nil];
	NSArray *section2 = [NSArray arrayWithObjects:dp5, dp6, dp7, dp8, nil];
	NSArray *section3 = [NSArray arrayWithObjects:dp9, dp10, dp11, dp12, nil];
	
	
	NSArray *keys = [NSArray arrayWithObjects:@"Device", @"Network", @"Other", nil];
	
	NSArray *objects = [NSArray arrayWithObjects:section1, section2, section3, nil];
	
	NSDictionary *devicePropertyDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	
	//int x = [devicePropertyDic.get]
	
	//[section1 release];
	//[section2 release];
	//[section3 release];
	[dp1 release];
	[dp2 release];
	[dp3 release];
	[dp4 release];
	[dp5 release];
	[dp6 release];
	[dp7 release];
	[dp8 release];
	[dp9 release];
	[dp10 release];
	[dp11 release];
	[dp12 release];
	
	return devicePropertyDic;
}

+(NSString *)zdDeviceModel {
    
    //NSString *property;
    
    UIDevice *device = [UIDevice currentDevice];
    
    return [device systemName];
}

+(NSString *)zdDeviceVersion {
    
    UIDevice *device = [UIDevice currentDevice];
    
    return [device systemVersion];
}

+(NSString *)zdSerialNumber {
    
    UIDevice *device = [UIDevice currentDevice];
    
    return [device uniqueIdentifier];
}

+(NSString *)zdImei {
    
    UIDevice *device = [UIDevice currentDevice];
    
    return [device model];
}

+(NSString *)zdExternalIP {
    
    UIDevice *device = [UIDevice currentDevice];
    
    return [device name];
}

+(NSString *)zdWiFiNetwork {
    
    UIDevice *device = [UIDevice currentDevice];
    
    return [device model];
}

+(NSString *)zdWiFiMac {
    
    UIDevice *device = [UIDevice currentDevice];
    
    return [device model];
}

+(NSString *)zdCarrier {
    
    UIDevice *device = [UIDevice currentDevice];
    
    return [device model];
}

+(NSString *)zdProcessor {
    
    UIDevice *device = [UIDevice currentDevice];
    
    return [device model];
}

+(NSString *)zdCapacity {
    
    UIDevice *device = [UIDevice currentDevice];
    
    return [device model];
}

+(NSString *)zdAvailable {
    
    UIDevice *device = [UIDevice currentDevice];
    
    return [device model];
}

+(NSString *)zdSongNumber {
    
    UIDevice *device = [UIDevice currentDevice];
    
    return [device model];
}

@end
