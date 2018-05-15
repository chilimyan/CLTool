//
//  CLSystemMacroTool.h
//  TIMDemo
//
//  Created by Apple on 2017/12/5.
//  Copyright © 2017年 chilim. All rights reserved.
//
#import "CLSystemTool.h"
#import "CLFileTool.h"
/**
 *  去除performSelector警告
 *
 *  @param code 需要屏蔽警告的代码
 *
 *  @return
 */
#define GJCFSystemRemovePerformSelectorLeakWarning(code)                    \
_Pragma("clang diagnostic push")                                        \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")     \
code;                                                                   \
_Pragma("clang diagnostic pop")                                         \


/**
 处理系统打印信息

 @param ...要打印的东西
 @return NSLog就只在Debug下有输出，Release下不输出了
 */
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define NSLog_func() NSLog(@"%s", __func__)
#else
#define NSLog(...)
#define NSLog_func()
#endif

/**
 *  判断系统是否iOS7及以上
 */
#define CLDeviceIsiOS7 ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f)

/**
 *  判断系统是否iOS8及以上
 */
#define CLDeviceIsiOS8 ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)

/**
 *  判断系统是否iOS9及以上
 */
#define CLDeviceIsiOS9 ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)

/**
 *  判断系统是否iOS9.1及以上
 */
#define CLDeviceIsiOS9_1 ([UIDevice currentDevice].systemVersion.floatValue >= 9.1f)

/**
 *  判断系统是否iOS10及以上
 */
#define CLDeviceIsiOS10 ([UIDevice currentDevice].systemVersion.floatValue >= 10.0f)

/**
 *  判断系统是否iOS11及以上
 */
#define CLDeviceIsiOS11 ([UIDevice currentDevice].systemVersion.floatValue >= 11.0f)

/**
 *  判断设备是否ipad
 */
#define CLDeviceIsIPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/**
 *  判断设备是否iphone
 */
#define CLDeviceIsIPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define CLScreenMaxLength (MAX(CLScreen.width, CLScreen.height))

#define CLScreenMinLength (MIN(CLScreen.width, CLScreen.height))

/**
 *  判断设备是否iphone4
 */
#define CLDeviceIsIPhone_4 (CLDeviceIsIPhone && CLScreenMaxLength < 568.0)

/**
 *  判断设备是否iphone5
 */
#define CLDeviceIsIPhone_5 (CLDeviceIsIPhone && CLScreenMaxLength == 568.0)

/**
 *  判断设备是否iphone6
 */
#define CLDeviceIsIPhone_6 (CLDeviceIsIPhone && CLScreenMaxLength == 667.0)

/**
 *  判断设备是否iphone6 plus
 */
#define CLDeviceIsIPhone_6P (CLDeviceIsIPhone && CLScreenMaxLength == 736.0)

/**
 *  判断设备是否iphone x
 */
#define CLDeviceIsIPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  获取设备导航条高度
 */
#define CLNavHeight (CLDeviceIsIPhoneX ? 88 : 64)

/**
 *  获取iphone x底部安全区域
 */
#define CLDownHeight (CLDeviceIsIPhoneX ? 34 : 0)

/**
 *  获取设备屏幕大小
 */
#define CLScreen [UIScreen mainScreen].bounds.size

/**
 *  创建self弱引用
 */
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

/**
 *  创建对象弱引用
 */
#define CLWeakObject(anObject)  __weak __typeof(anObject)

/**
 *  创建对象强引用
 */
#define CLStrongObject(anObject) __strong __typeof(anObject)

/**
 *  获取mainBundle内名字为fileName的文件的路径
 */
#define CLMainBundlePath(fileName) [CLSystemTool cl_mainBundlePath:fileName]

/**
 *  获取路径为bundlePath的指定bundle中文件名为fileName的文件路径
 */
#define CLBundlePath(bundlePath,fileName) [CLSystemTool cl_bundle:bundlePath file:fileName]

/**
 检查是否是一个空对象

 @param anObject 要检查的对象
 @return 空对象返回YES，否则返回NO
 */
#define CLObjectIsNull(anObject) [CLSystemTool cl_isNullObject:anObject]

/**
 获取设备机型

 @return 返回设备机型，如iphone x
 */
#define CLSystemDeviceName [CLSystemTool cl_getDeviceName]

/**
 获取设备名称
 
 @return 返回设备名称
 */
#define CLSystemDeviceOwnName [CLSystemTool cl_getDeviceOwnName]

/**
 获取系统版本
 
 @return 返回系统版本
 */
#define CLSystemVersion [CLSystemTool cl_getSystemVersion]

/**
 获取系统名称
 
 @return 返回系统名称
 */
#define CLSystemName [CLSystemTool cl_getSystemName]

/**
 获取系统UUID
 
 @return 返回系统UUID
 */
#define CLSystemUUID [CLSystemTool cl_getUUID]

/**
 获取系统WIFI名称
 
 @return 返回系统WIFI名称
 */
#define CLSystemSSID [CLSystemTool cl_getSSID]

/**
 获取系统WIFIMAC地址
 
 @return 返回系统WIFIMAC地址
 */
#define CLSystemBSSID [CLSystemTool cl_getBSSID]

/**
 获取系统运营商信息
 
 @return 返回系统运营商信息
 */
#define CLSystemCarrierName [CLSystemTool cl_getCurrentCarrierName]

/**
 获取系统IP地址

 @param preferIPv4 YES获取ipv4地址，否则获取ipv6地址
 @return 返回系统IP地址
 */
#define CLSystemIPAddress(preferIPv4) [CLSystemTool cl_getIPAddress:preferIPv4]

/**
 获取APP版本号
 
 @return 返回APP版本号
 */
#define CLSystemAppBundleVersion [CLSystemTool cl_getAppBundleVersion]

/**
 获取APP版本名称
 
 @return 返回APP版本名称
 */
#define CLSystemAppShortVersion [CLSystemTool cl_getAppShortVersion]

/**
 *  APP内打开Url
 */
#define CLSystemOpenUrl(string) [CLSystemTool cl_canOpenUrl:string]

/**
 *  APP内拨打电话
 */
#define CLSystemPhoneCall(string) [CLSystemTool cl_canPhoneCall:string]

/**
 *  状态栏网络加载显示
 */
#define CLSystemShowNetworkIndicatorActivity(state) [CLSystemTool cl_showNetworkIndicatorActivity:state]

/**
 APP内发邮件
 
 @param email 邮件地址
 @param delegate 当前Controller
 */
#define CLSystemSendEmail(email,delegate) [CLSystemTool cl_emailSendTo:email delegate:delegate]

/**
 APP内发短信
 
 @param phone 号码
 @param delegate 当前Controller
 */
#define CLSystemSendMessage(phone,delegate) [CLSystemTool cl_messageSendTo:phone delegate:delegate]

/**
 系统通知中心

 @return 返回系统通知中心
 */
#define CLNotificationCenter [CLSystemTool cl_defaultCenter]

/**
 系统通知中心发noti名字的通知

 @param noti 名称
 @return 系统通知中心发noti名字的通知
 */
#define CLNotificationPost(noti) [CLSystemTool cl_postNoti:noti]

/**
 系统通知中心发noti名字的通知，携带参数对象object

 @param noti 名称
 @param obj 参数对象
 @return 系统通知中心发noti名字的通知，携带参数对象object
 */
#define CLNotificationPostObj(noti,obj) [CLSystemTool cl_postNoti:noti withObject:obj]

/**
 系统通知中心发noti名字的通知，携带参数对象object ,携带用户自定义信息userInfo

 @param noti 名称
 @param obj 参数对象
 @param userInfo 用户自定义信息
 @return 系统通知中心发noti名字的通知，携带参数对象object ,携带用户自定义信息userInfo
 */
#define CLNotificationPostObjUserInfo(noti,obj,userInfo) [CLSystemTool cl_postNoti:noti withObject:obj withUserInfo:userInfo]


