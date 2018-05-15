//
//  CLStringTool.m
//  TIMDemo
//
//  Created by Apple on 2017/12/4.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLStringTool.h"

@implementation CLStringTool

+ (NSString *)verticalString:(NSString *)string{
    NSMutableString * str = [[NSMutableString alloc] initWithString:string];
    NSInteger count = str.length;
    for (int i = 1; i < count; i ++) {
        [str insertString:@"\n" atIndex:i*2 - 1];
    }
    return str;
}

+ (BOOL)cl_stringIsNull:(NSString *)string{
    if (string == nil || string == NULL)
    {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([string isKindOfClass:[NSString class]]) {
        if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0 || [string isEqualToString:@""]) {
            return YES;
        }
    }
    return NO;
}

+ (NSString *)cl_stringFilterWhiteSpace:(NSString *)string{
    if ([CLStringTool cl_stringIsNull:string]) {
        return @"";
    }else{
        return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
}

+ (NSString *)cl_stringFilterTailingWhiteSpace:(NSString *)string{
    if ([CLStringTool cl_stringIsNull:string]) {
        return @"";
    }else{
        NSRange range = [string rangeOfString:@"\\s*$" options:NSRegularExpressionSearch];
        return [string stringByReplacingCharactersInRange:range withString:@""];
    }
}

+ (NSString *)cl_stringFilterLeadingWhiteSpace:(NSString *)string{
    if ([CLStringTool cl_stringIsNull:string]) {
        return @"";
    }else{
        NSRange range = [string rangeOfString:@"^\\s*" options:NSRegularExpressionSearch];
        return [string stringByReplacingCharactersInRange:range withString:@""];
    }
}

+ (NSInteger)cl_stringToNSInteger:(NSString *)string{
    if ([CLStringTool cl_stringIsNull:string]) {
        return NSIntegerMax;
    }else{
        return [string integerValue];
    }
}

+ (CGFloat)cl_stringToFloat:(NSString *)string{
    if ([CLStringTool cl_stringIsNull:string]) {
        return CGFLOAT_MAX;
    }else{
        return [string floatValue];
    }
}

+ (double)cl_stringToDouble:(NSString *)string{
    if ([CLStringTool cl_stringIsNull:string]) {
        return CGFLOAT_MAX;
    }else{
        return [string doubleValue];
    }
}

+ (BOOL)cl_stringToBool:(NSString *)string{
    if ([CLStringTool cl_stringIsNull:string]) {
        return NO;
    }else{
        return [string boolValue];
    }
}

+ (NSString *)cl_stringFromNSInteger:(NSInteger)integerValue{
    return [NSString stringWithFormat:@"%ld",(long)integerValue];
}

+ (NSString *)cl_stringFromCGFloat:(CGFloat)floatValue{
    return [NSString stringWithFormat:@"%f",floatValue];
}

+ (NSString *)cl_stringFromDouble:(double)doubleValue{
    return [NSString stringWithFormat:@"%lf",doubleValue];
}

+ (NSString *)cl_stringFromBool:(BOOL)boolValue{
    return [NSString stringWithFormat:@"%d",boolValue];
}

+ (BOOL)sourceString:(NSString*)sourceString regexMatch:(NSString *)regexString
{
    if ([CLStringTool cl_stringIsNull:sourceString] || [CLStringTool cl_stringIsNull:regexString]) {
        return NO;
    }
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexString];
    return [emailTest evaluateWithObject:sourceString];
}

+ (BOOL)cl_stringIsValidateEmail:(NSString *)string{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [CLStringTool sourceString:string regexMatch:emailRegex];
}

+ (BOOL)cl_stringIsValidatePhoneNumber:(NSString *)string{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10 * 中国移动：China Mobile
     11 * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12 */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15 * 中国联通：China Unicom
     16 * 130,131,132,152,155,156,185,186
     17 */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20 * 中国电信：China Telecom
     21 * 133,1349,153,180,189
     22 */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25 * 大陆地区固话及小灵通
     26 * 区号：010,020,021,022,023,024,025,027,028,029
     27 * 号码：七位或八位
     28 */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:string] == YES)
        || ([regextestcm evaluateWithObject:string] == YES)
        || ([regextestct evaluateWithObject:string] == YES)
        || ([regextestcu evaluateWithObject:string] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)cl_stringIsValidateUrl:(NSString *)string{
    NSString *checkRegex = @"^(([hH][tT]{2}[pP][sS]?)|([fF][tT][pP]))\\:\\/\\/[wW]{3}\\.[\\w-]+\\.\\w{2,4}(\\/.*)?$";
    return [CLStringTool sourceString:string regexMatch:checkRegex];
}

+ (BOOL)cl_stringIsValidateMailCode:(NSString *)string{
    NSString *mailCodeRegex = @"^\\d{6}$";
    return [CLStringTool sourceString:string regexMatch:mailCodeRegex];
}

+ (BOOL)cl_stringIsValidateCardId:(NSString *)string{
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    return [CLStringTool sourceString:string regexMatch:regex2];
}

+ (BOOL)cl_stringIsValidateCarNumber:(NSString *)string{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    return [CLStringTool sourceString:string regexMatch:carRegex];
}

+ (BOOL)cl_stringHasCharAndNumber:(NSString *)string{
    NSString *carRegex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{%@,}$";
    return [CLStringTool sourceString:string regexMatch:carRegex];
}

+ (BOOL)cl_stringHasCapitalCharAndNumber:(NSString *)string{
    NSString *carRegex = @"(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])[a-zA-Z0-9]{%@,}$";
    return [CLStringTool sourceString:string regexMatch:carRegex];
}

+ (BOOL)cl_stringHasEmoji:(NSString *)string{
    if ([string containsString:@"["] &&  [string containsString:@"]"] && [[string substringFromIndex:string.length - 1] isEqualToString:@"]"]) {
        return YES;
    }
    return NO;
}

+ (NSString *)cl_stringCurrentTimeStamp{
    NSDate *now = [NSDate date];
    NSTimeInterval timeInterval = [now timeIntervalSinceReferenceDate];
    
    NSString *timeString = [NSString stringWithFormat:@"%lf",timeInterval];
    timeString = [timeString stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    return timeString;
}

+ (CGSize)cl_stringSize:(NSString *)string textSizeIn:(CGSize)size font:(UIFont *)font{
    return [CLStringTool cl_stringSize:string textSizeIn:size font:font breakMode:NSLineBreakByWordWrapping];
}
+ (CGSize)cl_stringSize:(NSString *)string textSizeIn:(CGSize)size font:(UIFont *)font breakMode:(NSLineBreakMode)breakMode{
    return [CLStringTool cl_stringSize:string textSizeIn:size font:font breakMode:breakMode align:NSTextAlignmentLeft];
}
+ (CGSize)cl_stringSize:(NSString *)string textSizeIn:(CGSize)size font:(UIFont *)font breakMode:(NSLineBreakMode)breakMode align:(NSTextAlignment)alignment{
   
    CGSize contentSize = CGSizeZero;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = breakMode;
    paragraphStyle.alignment = alignment;
    
    NSDictionary* attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
    contentSize = [string boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:attributes context:nil].size;
    contentSize = CGSizeMake((int)contentSize.width + 1, (int)contentSize.height + 1);
    return contentSize;
}

+ (NSUInteger)cl_utf8Length:(NSString *)string
{
    size_t length = strlen([string UTF8String]);
    return length;
}

@end
