//
//  NSDate+CLTool.m
//  TIMDemo
//
//  Created by Apple on 2017/12/7.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "NSDate+CLTool.h"
#import "CLSystemTool.h"

@implementation NSDate (CLTool)

+ (NSCalendar *)cl_sharedCalender{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    [currentCalendar setTimeZone:[NSTimeZone systemTimeZone]];
    [currentCalendar setFirstWeekday:2];
    return currentCalendar;
}

+ (NSDateFormatter *)cl_sharedDateFormat{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!dateFormatter) {
            dateFormatter = [[NSDateFormatter alloc]init];
        }
    });
    return dateFormatter;
}

- (NSString *)cl_dateToString{
    return [self cl_dateToString:self format:NSDateHelperFormatDate];
}

+ (NSDate *)cl_stringToDate:(NSString *)string{
    if ([CLSystemTool cl_isNullObject:string]) {
        return nil;
    }
    return [[self class] cl_stringToDate:string format:NSDateHelperFormatDate];
}

- (NSString *)cl_dateToStringWithSecond{
    return [self cl_dateToString:self format:NSDateHelperFormatDateWithSecond];
}

+ (NSDate *)cl_stringToDateWithSecond:(NSString *)string{
    if ([CLSystemTool cl_isNullObject:string]) {
        return nil;
    }
    return [[self class] cl_stringToDate:string format:NSDateHelperFormatDateWithSecond];
}

- (NSString *)cl_dateToStringNoSecond{
    return [self cl_dateToString:self format:NSDateHelperFormatDateWithoutSecond];
}

+ (NSDate *)cl_stringToDateNOSecond:(NSString *)string{
    if ([CLSystemTool cl_isNullObject:string]) {
        return nil;
    }
    return [[self class] cl_stringToDate:string format:NSDateHelperFormatDateWithoutSecond];
}

- (NSString *)cl_dateToStringTimeInterval{
    return [self cl_dateToString:self format:NSDateHelperFormatTimeInterval];
}

+ (NSDate *)cl_stringToDate:(NSString *)string format:(NSString *)format{
    if ([CLSystemTool cl_isNullObject:string] || [CLSystemTool cl_isNullObject:format]) {
        return nil;
    }
    NSDateFormatter *formatter = [[self class] cl_sharedDateFormat];
    [formatter setDateFormat:format];
    NSDate *date = [formatter dateFromString:string];
    return date;
}

- (NSString *)cl_dateToString:(NSDate *)date format:(NSString *)format
{
    if ([CLSystemTool cl_isNullObject:date] || [CLSystemTool cl_isNullObject:format]) {
        return nil;
    }
    [[[self class] cl_sharedDateFormat] setDateFormat:format];
    NSString *timestamp_str = [[[self class] cl_sharedDateFormat] stringFromDate:date];
    return timestamp_str;
}

- (NSInteger)cl_getYear{
    NSCalendar *calendar = [[self class] cl_sharedCalender];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitYear) fromDate:self];
    return [dateComponents year];
}

- (NSInteger)cl_getMonth{
    NSCalendar *calendar = [[self class] cl_sharedCalender];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitMonth) fromDate:self];
    return [dateComponents month];
}

- (NSInteger)cl_getDay{
    NSCalendar *calendar = [[self class] cl_sharedCalender];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitDay) fromDate:self];
    return [dateComponents day];
}

- (NSInteger)cl_getHour{
    NSCalendar *calendar = [[self class] cl_sharedCalender];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitHour) fromDate:self];
    return [dateComponents hour];
}

- (NSInteger)cl_getMinute{
    NSCalendar *calendar = [[self class] cl_sharedCalender];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitMinute) fromDate:self];
    return [dateComponents minute];
}

- (NSInteger)cl_getSecondes{
    NSCalendar *calendar = [[self class] cl_sharedCalender];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitSecond) fromDate:self];
    return [dateComponents second];
}

- (NSString *)cl_timeAgoSinceNow{
    long long timeNow = [self timeIntervalSince1970];
    NSCalendar * calendar= [[self class] cl_sharedCalender];
    NSInteger unitFlags = NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitWeekday ;
    NSDateComponents * component=[calendar components:unitFlags fromDate:self];
    
    NSInteger year=[component year];
    NSInteger month=[component month];
    NSInteger day=[component day];
    
    NSDate * today=[NSDate date];
    component=[calendar components:unitFlags fromDate:today];
    
    NSInteger t_year=[component year];
    
    NSString*string=nil;
    
    long long now = [today timeIntervalSince1970];
    
    long long  distance= now - timeNow;
    if(distance<60)
    string=@"刚刚";
    else if(distance<60*60)
    string=[NSString stringWithFormat:@"%lld分钟前",distance/60];
    else if(distance<60*60*24)
    string=[NSString stringWithFormat:@"%lld小时前",distance/60/60];
    else if(distance<60*60*24*7)
    string=[NSString stringWithFormat:@"%lld天前",distance/60/60/24];
    else if(year==t_year)
    string=[NSString stringWithFormat:@"%ld月%ld日",(long)month,(long)day];
    else
    string=[NSString stringWithFormat:@"%ld年%ld月%ld日",(long)year,(long)month,(long)day];
    
    return string;
}

- (long long)cl_distanceWithDate:(NSDate *)date{
    if ([CLSystemTool cl_isNullObject:date]) {
        return NSIntegerMax;
    }
    long long timeNow = [self timeIntervalSince1970];
    NSCalendar * calendar= [[self class] cl_sharedCalender];
    NSInteger unitFlags = NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitWeekday ;
    NSDateComponents * component=[calendar components:unitFlags fromDate:self];
    component=[calendar components:unitFlags fromDate:date];
    long long now = [date timeIntervalSince1970];
    
    long long  distance= now - timeNow;
    return distance;
}

- (NSInteger)cl_getWeekDay{
    NSDateComponents *weekdayComponents = [[[self class] cl_sharedCalender] components:(NSCalendarUnitWeekday) fromDate:self];
    NSUInteger wDay = [weekdayComponents weekday];
    //将第一天设为周一
    if (wDay == 1) {
        wDay = 7;
    }else{
        wDay = wDay - 1;
    }
    return wDay;
}

- (NSString *)cl_getWeekDayString{
    NSDictionary *weekNameDict = @{
                                   @(1):@"一",
                                   @(2):@"二",
                                   @(3):@"三",
                                   @(4):@"四",
                                   @(5):@"五",
                                   @(6):@"六",
                                   @(7):@"日",
                                   };
    NSString *weekName = [weekNameDict objectForKey:@([self cl_getWeekDay])];
    return [NSString stringWithFormat:@"星期%@",weekName];
}

- (NSInteger)cl_getWeekNumberYear{
    NSCalendar *calendar = [[self class] cl_sharedCalender];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitWeekOfYear) fromDate:self];
    return [dateComponents weekOfYear];
}

- (NSInteger)cl_getWeekNumberMonth{
    NSCalendar *calendar = [[self class] cl_sharedCalender];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitWeekOfMonth) fromDate:self];
    return [dateComponents weekOfMonth];
}

- (NSInteger)cl_getMonthCount{
    NSCalendar *calendar = [[self class] cl_sharedCalender];
    return [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self].length;
}

- (NSInteger)cl_getMonthWeeksCount{
    NSUInteger weekOfFirstDay = [[self cl_beginOfMonth] cl_getWeekDay];
    NSUInteger numberDaysInMonth = [self cl_getMonthCount];

    return ((weekOfFirstDay - 1 + numberDaysInMonth) % 7) ? ((weekOfFirstDay - 1 + numberDaysInMonth) / 7 + 1): ((weekOfFirstDay - 1 + numberDaysInMonth) / 7);
}

- (NSDate *)cl_beginOfMonth{
    NSCalendar *calendar = [[self class] cl_sharedCalender];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    [dateComponents setDay:1];
    return [calendar dateFromComponents:dateComponents];
}

- (NSDate *)cl_endOfMonth{
    NSCalendar *calendar = [[self class] cl_sharedCalender];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    [dateComponents setDay:[self cl_getMonthCount]];
    return [calendar dateFromComponents:dateComponents];
}

- (NSDate *)cl_beginOfWeek{
    NSCalendar *calendar = [[self class] cl_sharedCalender];
    NSDate *beginningOfWeek = nil;
    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitWeekOfMonth startDate:&beginningOfWeek
                           interval:NULL forDate:self];
    if (ok) {
        return beginningOfWeek;
    }
    NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:self];
    NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
    [componentsToSubtract setDay: 0 - ([weekdayComponents weekday] - 1)];
    beginningOfWeek = nil;
    beginningOfWeek = [calendar dateByAddingComponents:componentsToSubtract toDate:self options:0];
    
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                               fromDate:beginningOfWeek];
    return [calendar dateFromComponents:components];
}

- (NSDate *)cl_endOfWeek{
    NSCalendar *calendar = [[self class] cl_sharedCalender];
    // Get the weekday component of the current date
    NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:self];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    // to get the end of week for a particular date, add (7 - weekday) days
    [componentsToAdd setDay:(7 - [weekdayComponents weekday] + 1)];
    NSDate *endOfWeek = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
    return endOfWeek;
}

- (NSDate *)cl_dateByAddingDays:(NSInteger)day{
    NSCalendar *calendar = [[self class] cl_sharedCalender];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:day];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (BOOL)cl_isToday{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:[NSDate date]];
    NSDate *today = [cal dateFromComponents:components];
    components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:self];
    NSDate *otherDate = [cal dateFromComponents:components];
    
    return [today isEqualToDate:otherDate];
}

- (BOOL)cl_isTomorrow{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:[[NSDate date] cl_dateByAddingDays:1]];
    NSDate *tomorrow = [cal dateFromComponents:components];
    components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:self];
    NSDate *otherDate = [cal dateFromComponents:components];
    
    return [tomorrow isEqualToDate:otherDate];
}

- (BOOL)cl_isYesterday{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:[[NSDate date] cl_dateByAddingDays:-1]];
    NSDate *tomorrow = [cal dateFromComponents:components];
    components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:self];
    NSDate *otherDate = [cal dateFromComponents:components];
    
    return [tomorrow isEqualToDate:otherDate];
}

- (BOOL)cl_isSameDay:(NSDate *)date{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:self];
    NSDate *dateOne = [cal dateFromComponents:components];
    components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:date];
    NSDate *dateTwo = [cal dateFromComponents:components];
    return [dateOne isEqualToDate:dateTwo];
}

@end

