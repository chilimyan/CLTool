//
//  CLStringTool.h
//  TIMDemo
//
//  Created by Apple on 2017/12/4.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLStringTool : NSObject

+ (NSString *)verticalString:(NSString *)string;

+ (BOOL)cl_stringIsNull:(NSString *)string;

+ (NSString *)cl_stringFilterWhiteSpace:(NSString *)string;

+ (NSString *)cl_stringFilterTailingWhiteSpace:(NSString *)string;

+ (NSString *)cl_stringFilterLeadingWhiteSpace:(NSString *)string;

+ (NSInteger)cl_stringToNSInteger:(NSString *)string;

+ (CGFloat)cl_stringToFloat:(NSString *)string;

+ (double)cl_stringToDouble:(NSString *)string;

+ (BOOL)cl_stringToBool:(NSString *)string;

+ (NSString *)cl_stringFromNSInteger:(NSInteger)integerValue;

+ (NSString *)cl_stringFromCGFloat:(CGFloat)floatValue;

+ (NSString *)cl_stringFromDouble:(double)doubleValue;

+ (NSString *)cl_stringFromBool:(BOOL)boolValue;

+ (BOOL)cl_stringIsValidateEmail:(NSString *)string;

+ (BOOL)cl_stringIsValidatePhoneNumber:(NSString *)string;

+ (BOOL)cl_stringIsValidateUrl:(NSString *)string;

+ (BOOL)cl_stringIsValidateMailCode:(NSString *)string;

+ (BOOL)cl_stringIsValidateCardId:(NSString *)string;

+ (BOOL)cl_stringIsValidateCarNumber:(NSString *)string;

+ (BOOL)cl_stringHasCharAndNumber:(NSString *)string;

+ (BOOL)cl_stringHasCapitalCharAndNumber:(NSString *)string;

+ (BOOL)cl_stringHasEmoji:(NSString *)string;

+ (NSString *)cl_stringCurrentTimeStamp;
/**
 根据文字多少计算高度
 */
+ (CGSize)cl_stringSize:(NSString *)string textSizeIn:(CGSize)size font:(UIFont *)font;
+ (CGSize)cl_stringSize:(NSString *)string textSizeIn:(CGSize)size font:(UIFont *)font breakMode:(NSLineBreakMode)breakMode;
+ (CGSize)cl_stringSize:(NSString *)string textSizeIn:(CGSize)size font:(UIFont *)font breakMode:(NSLineBreakMode)breakMode align:(NSTextAlignment)alignment;

+ (NSUInteger)cl_utf8Length:(NSString *)string;

@end
