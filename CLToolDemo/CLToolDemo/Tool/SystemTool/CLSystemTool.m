
//
//  CLSystemTool.m
//  TIMDemo
//
//  Created by Apple on 2017/12/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLSystemTool.h"
#import "CLKeyChainTool.h"
#import "CLStringTool.h"
#import <MessageUI/MessageUI.h>

#import <sys/utsname.h>
#import <UIKit/UIDevice.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>

@interface CLSystemTool()<UIAlertViewDelegate>

@end

@implementation CLSystemTool

+ (BOOL) cl_isNullObject:(id)anObject{
    if (!anObject || [anObject isKindOfClass:[NSNull class]]) {
        return YES;
    }else{
        return NO;
    }
}

+ (NSString *)cl_mainBundlePath:(NSString*)fileName{
    if ([CLStringTool cl_stringIsNull:fileName]) {
        return nil;
    }
    NSArray *fileArray = [fileName componentsSeparatedByString:@"."];
    if (fileArray.count < 2) {
        return nil;
    }
    return [[NSBundle mainBundle]  pathForResource:fileArray[0] ofType:fileArray[1]];
}

+ (NSString *)cl_bundle:(NSString *)bundle file:(NSString *)file
{
    if ([CLStringTool cl_stringIsNull:bundle] || [CLStringTool cl_stringIsNull:file]) {
        return nil;
    }
    return [bundle stringByAppendingPathComponent:file];
}


+ (NSString *)cl_getDeviceName{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"iPhone 7 plus";
    if ([deviceString isEqualToString:@"iPhone10,1"])    return @"iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,2"])    return @"iPhone 8 plus";
    if ([deviceString isEqualToString:@"iPhone11,1"])    return @"iPhone x";
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([deviceString isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
    if ([deviceString isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    if ([deviceString isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
    if ([deviceString isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    return deviceString ? deviceString : @"";
}

+ (NSString *)cl_getDeviceOwnName{
    UIDevice *device = [[UIDevice alloc] init];
    NSString *name = device.name;
    return name;
}

+ (NSString *)cl_getSystemVersion{
    UIDevice *device = [[UIDevice alloc] init];
    NSString *systemVersion = device.systemVersion;
    return systemVersion;
}

+ (NSString *)cl_getSystemName{
    UIDevice *device = [[UIDevice alloc] init];
    NSString *systemName = device.systemName;
    return systemName;
}

+ (NSString *)cl_getUUID{
    NSMutableDictionary *uuidKVPair = (NSMutableDictionary *)[CLKeyChainTool cl_loadData:@"com.wuqian.app.allinfo"];
    if (![uuidKVPair objectForKey:@"com.wuqian.app.uuid"]) {
        //存储唯一标识
        NSString *deviceId = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
        [usernamepasswordKVPairs setObject:deviceId forKey:@"com.wuqian.app.uuid"];
        [CLKeyChainTool cl_saveData:usernamepasswordKVPairs service:@"com.wuqian.app.allinfo"];
        return deviceId;
    }
    if ([uuidKVPair objectForKey:@"com.wuqian.app.uuid"]) {
        return [uuidKVPair objectForKey:@"com.wuqian.app.uuid"];
    }
    return @"";
}

+ (NSString *)cl_getSSID{
    id info = [CLSystemTool getNetworkInfo];
    if (info[@"SSID"]) {
        return info[@"SSID"];
    }
    return @"";
}

+ (id)getNetworkInfo{
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    id info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info) {
            break;
        }
    }
    return info;
}

+ (NSString *)cl_getBSSID{
    id info = [self getNetworkInfo];
    if (info[@"BSSID"]) {
        return info[@"BSSID"];
    }
    return @"";
}

+ (NSString *)cl_getCurrentCarrierName{
    CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
    return [[NSString alloc] initWithFormat:@"%@_%@_%@_%@", [carrier carrierName], [carrier mobileCountryCode], [carrier mobileNetworkCode], [carrier isoCountryCode]];
}

#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

//preferIPv4传YES获取IPV4的地址
+ (NSString *)cl_getIPAddress:(BOOL)preferIPv4
{
    NSArray *searchArray = preferIPv4 ?
    @[ IOS_VPN @"/" IP_ADDR_IPv4, IOS_VPN @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6 ] :
    @[ IOS_VPN @"/" IP_ADDR_IPv6, IOS_VPN @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4 ] ;
    
    NSDictionary *addresses = [self getIPAddresses];
    NSLog(@"addresses: %@", addresses);
    
    __block NSString *address;
    [searchArray enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop)
     {
         address = addresses[key];
         if([self isValidatIP:address]) *stop = YES;
     } ];
    return address ? address : @"0.0.0.0";
}

+ (BOOL)isValidatIP:(NSString *)ipAddress {
    if (ipAddress.length == 0) {
        return NO;
    }
    NSString *urlRegEx = @"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";
    
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:urlRegEx options:0 error:&error];
    
    if (regex != nil) {
        NSTextCheckingResult *firstMatch=[regex firstMatchInString:ipAddress options:0 range:NSMakeRange(0, [ipAddress length])];
        
        if (firstMatch) {
            NSRange resultRange = [firstMatch rangeAtIndex:0];
            NSString *result=[ipAddress substringWithRange:resultRange];
            //输出结果
            NSLog(@"%@",result);
            return YES;
        }
    }
    return NO;
}

+ (NSDictionary *)getIPAddresses
{
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    
    // retrieve the current interfaces - returns 0 on success
    struct ifaddrs *interfaces;
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
                continue; // deeply nested code harder to read
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;
                if(addr->sin_family == AF_INET) {
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv4;
                    }
                } else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv6;
                    }
                }
                if(type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : nil;
}

+ (NSString *)cl_getAppBundleVersion{
    NSString *softwareversion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    return softwareversion;
}

+ (NSString *)cl_getAppShortVersion{
    NSString *softwareversion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return softwareversion;
}

+ (void)cl_canOpenUrl:(NSString *)string{
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string] options:@{} completionHandler:NULL];
    }else{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string]];
    }
}

+ (void)cl_canPhoneCall:(NSString *)string{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:string delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"拨打", nil];
    alert.tag = 1;
    [alert show];
}

//拨打电话
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==1){
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", alertView.message]] options:@{} completionHandler:NULL];
        }else{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", alertView.message]]];
        }
    }
}

+ (void)cl_showNetworkIndicatorActivity:(BOOL)state{
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:state];
}

+ (NSNotificationCenter *)cl_defaultCenter
{
    return [NSNotificationCenter defaultCenter];
}

+ (void)cl_postNoti:(NSString *)notiName
{
    [CLSystemTool cl_postNoti:notiName withObject:nil];
}

+ (void)cl_postNoti:(NSString *)notiName withObject:(id)obj
{
    [CLSystemTool cl_postNoti:notiName withObject:obj withUserInfo:nil];
}

+ (void)cl_postNoti:(NSString *)notiName withObject:(id)obj withUserInfo:(NSDictionary *)infoDict
{
    if ([CLStringTool cl_stringIsNull:notiName]) {
        return;
    }
    [[CLSystemTool cl_defaultCenter]postNotificationName:notiName object:obj userInfo:infoDict];
}


+ (void)cl_emailSendTo:(NSString *)email delegate:(id)delegate{
    if (![MFMailComposeViewController canSendMail])
    {
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto:%@", email]] options:@{} completionHandler:NULL];
        }else{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto:%@", email]]];
        }
        return;
    }
    
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"UINavigationBarTranslucent"]){
        UIColor *qqColor;
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"qqColor"];
        if(data){
            qqColor = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }
        if(qqColor!=nil){
            picker.navigationBar.barStyle = UIBarStyleDefault;
            picker.navigationBar.tintColor = qqColor;
        }
    }else{
        picker.navigationBar.barStyle = UIBarStyleBlack;
        picker.navigationBar.tintColor = [UIColor whiteColor];
    }
    picker.mailComposeDelegate = delegate;
    
    [picker setSubject:@"主题(VWORK)"];
    
    // Set up recipients
    NSArray *toRecipients = [NSArray arrayWithObject:email];
    NSArray *ccRecipients = @[];
    NSArray *bccRecipients = @[];
    
    [picker setToRecipients:toRecipients];
    [picker setCcRecipients:ccRecipients];
    [picker setBccRecipients:bccRecipients];
    
    NSString *emailBody = @"内容(VWORK)";
    [picker setMessageBody:emailBody isHTML:NO];
    
    [delegate presentViewController:picker animated:YES completion:NULL];
}

+ (void)cl_messageSendTo:(NSString *)phone delegate:(id)delegate{
    if (![MFMessageComposeViewController canSendText])
    {
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms:%@", phone]] options:@{} completionHandler:NULL];
        }else{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms:%@", phone]]];
        }
        return;
    }
    
    MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"UINavigationBarTranslucent"]){
        UIColor *qqColor;
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"qqColor"];
        if(data){
            qqColor = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }
        if(qqColor!=nil){
            picker.navigationBar.barStyle = UIBarStyleDefault;
            picker.navigationBar.tintColor = qqColor;
        }
    }else{
        picker.navigationBar.barStyle = UIBarStyleBlack;
        picker.navigationBar.tintColor = [UIColor whiteColor];
    }
    picker.messageComposeDelegate = delegate;
    picker.recipients = @[phone];
    picker.body = @"内容(VWORK)";
    
    [delegate presentViewController:picker animated:YES completion:NULL];
}


@end
