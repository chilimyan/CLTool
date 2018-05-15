//
//  CLSystemTool.h
//  TIMDemo
//
//  Created by Apple on 2017/12/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLSystemTool : NSObject

+ (BOOL) cl_isNullObject:(id)anObject;

+ (NSString *)cl_mainBundlePath:(NSString*)fileName;

+ (NSString *)cl_bundle:(NSString *)bundle file:(NSString *)file;

+ (NSString *)cl_getDeviceName;

+ (NSString *)cl_getDeviceOwnName;

+ (NSString *)cl_getSystemVersion;

+ (NSString *)cl_getSystemName;

+ (NSString *)cl_getUUID;

+ (NSString *)cl_getSSID;

+ (NSString *)cl_getBSSID;

+ (NSString *)cl_getCurrentCarrierName;

+ (NSString *)cl_getIPAddress:(BOOL)preferIPv4;

+ (NSString *)cl_getAppBundleVersion;

+ (NSString *)cl_getAppShortVersion;

+ (void)cl_canPhoneCall:(NSString *)string;

+ (void)cl_canOpenUrl:(NSString *)string;

+ (void)cl_showNetworkIndicatorActivity:(BOOL)state;

+ (void)cl_emailSendTo:(NSString *)email delegate:(id)delegate;

+ (void)cl_messageSendTo:(NSString *)phone delegate:(id)delegate;

+ (NSNotificationCenter *)cl_defaultCenter;

+ (void)cl_postNoti:(NSString *)notiName;

+ (void)cl_postNoti:(NSString *)notiName withObject:(id)obj;

+ (void)cl_postNoti:(NSString *)notiName withObject:(id)obj withUserInfo:(NSDictionary *)infoDict;

@end
