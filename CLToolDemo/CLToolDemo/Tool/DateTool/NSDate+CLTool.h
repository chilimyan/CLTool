//
//  NSDate+CLTool.h
//  TIMDemo
//
//  Created by Apple on 2017/12/7.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *NSDateHelperFormatDateWithSecond     = @"yyyy-MM-dd HH:mm:ss";
static NSString *NSDateHelperFormatDateWithoutSecond  = @"yyyy-MM-dd HH:mm";
static NSString *NSDateHelperFormatDate               = @"yyyy-MM-dd";
static NSString *NSDateHelperFormatSecond             = @"HH:mm:ss";
static NSString *NSDateHelperFormatTimeInterval       = @"yyyyMMddHHmmss";

@interface NSDate (CLTool)

/**
 日期转字符串

 @return  返回yyyy-MM-dd格式的日期字符串
 */
- (NSString *)cl_dateToString;

/**
 字符串转日期

 @param string 要转为日期的字符串
 @return 返回yyyy-MM-dd格式的日期
 */
+ (NSDate *)cl_stringToDate:(NSString *)string;

/**
 日期转字符串

 @return 返回yyyy-MM-dd HH:mm:ss格式的日期字符串
 */
- (NSString *)cl_dateToStringWithSecond;

/**
 字符串转日期

 @param string 要转为日期的字符串
 @return 返回yyyy-MM-dd HH:mm:ss格式的日期
 */
+ (NSDate *)cl_stringToDateWithSecond:(NSString *)string;

/**
 日期转字符串

 @return 返回yyyy-MM-dd HH:mm格式的日期字符串
 */
- (NSString *)cl_dateToStringNoSecond;

/**
 字符串转日期

 @param string 要转为日期的字符串
 @return 返回yyyy-MM-dd HH:mm格式的日期
 */
+ (NSDate *)cl_stringToDateNOSecond:(NSString *)string;

/**
 自定义字符串转日期

 @param string 要转为日期的字符串
 @param format 日期格式
 @return 返回自定义的日期形式
 */
+ (NSDate *)cl_stringToDate:(NSString *)string format:(NSString *)format;

/**
 自定义日期转字符串

 @param date 要转为字符串的日期
 @param format 日期格式
 @return 返回自定义日期格式的字符串
 */
- (NSString *)cl_dateToString:(NSDate *)date format:(NSString *)format;
/**
 日期转字符串

 @return 返回yyyyMMddHHmmss格式的日期
 */
- (NSString *)cl_dateToStringTimeInterval;

/**
 获取当前日期的年份

 @return 返回年份
 */
- (NSInteger)cl_getYear;

/**
 获取当前日期的月份

 @return 返回月份
 */
- (NSInteger)cl_getMonth;

/**
 获取当前日期的天

 @return 返回天
 */
- (NSInteger)cl_getDay;

/**
 返回当前日期的小时

 @return 返回小时
 */
- (NSInteger)cl_getHour;

/**
 返回当前日期的分钟

 @return 返回分钟
 */
- (NSInteger)cl_getMinute;

/**
 返回当前日期的秒数

 @return 返回秒
 */
- (NSInteger)cl_getSecondes;

/**
 相对于当前日期过去多少时间

 @return 相对于当前日期过去多少时间的字符串
 */
- (NSString *)cl_timeAgoSinceNow;

/**
 获取两个时间差

 @param date 参照的日期
 @return 返回两个时间相差多少秒，当前日期大于date时返回值<0，否则返回值>0
 */
- (long long)cl_distanceWithDate:(NSDate *)date;

/**
 获取当前日期是星期几

 @return 返回星期几，iOS中规定的就是周日为1，周一为2，周二为3，周三为4，周四为5，周五为6，周六为7
 */
- (NSInteger)cl_getWeekDay;
/**
 获取当前日期是星期几
 
 @return 返回星期几的字符串
 */
- (NSString *)cl_getWeekDayString;

/**
 当前日期属于全年的第几周

 @return 返回第几周
 */
- (NSInteger)cl_getWeekNumberYear;

/**
 当前日期属于当月的第几周
 
 @return 返回第几周
 */
- (NSInteger)cl_getWeekNumberMonth;

/**
 当前日期所在月份有多少天

 @return 返回这个月的总天数
 */
- (NSInteger)cl_getMonthCount;

/**
 传入日期所在月有多少周

 @return 返回这个月的周数
 */
- (NSInteger)cl_getMonthWeeksCount;

/**
 获取当前日期所在月的第一天

 @return 返回第一天
 */
- (NSDate *)cl_beginOfMonth;

/**
 获取当前日期所在月的最后一天
 
 @return 返回最后一天
 */
- (NSDate *)cl_endOfMonth;

/**
 获取当前日期所周的第一天
 
 @return 返回第一天
 */
- (NSDate *)cl_beginOfWeek;

/**
 获取当前日期所在周的最后一天
 
 @return 返回最后一天
 */
- (NSDate *)cl_endOfWeek;

/**
 返回在当前日期基础上相隔天数的新日期
 
 @param day 相隔的天数
 @return 返回新的日期
 */
- (NSDate *)cl_dateByAddingDays:(NSInteger)day;

/**
 判断当前日期是不是今天

 @return 是今天返回YES，否则返回NO
 */
- (BOOL)cl_isToday;

/**
 判断当前日期是不是明天
 
 @return 是明天返回YES，否则返回NO
 */
- (BOOL)cl_isTomorrow;

/**
 判断当前日期是不是昨天

 @return 是昨天返回YES，否则返回NO
 */
- (BOOL)cl_isYesterday;

/**
 判断当前日期是否和date是同一天

 @param date 要比较的日期
 @return 同一天返回YES，否则返回NO
 */
-(BOOL)cl_isSameDay:(NSDate *)date;

@end
