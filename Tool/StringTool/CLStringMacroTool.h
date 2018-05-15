//
//  CLStringMacroTool.h
//  TIMDemo
//
//  Created by Apple on 2017/12/4.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLStringTool.h"


/**
 判断字符串是否为空字符串

 @param string 要判断的字符串
 @return 空字符串返回YES，否则返回NO
 */
#define CLStringIsNull(string) [CLStringTool cl_stringIsNull:string]

/**
 过滤字符串中的空格

 @param string 要过滤的字符串
 @return 返回过滤掉空格后的字符串
 */
#define CLStringFilterWhiteSpace(string) [CLStringTool cl_stringFilterWhiteSpace:string]

/**
 过滤字符串结尾的空格
 
 @param string 要过滤的字符串
 @return 返回过滤掉结尾空格后的字符串
 */
#define CLStringFilterTailingWhiteSpace(string) [CLStringTool cl_stringFilterTailingWhiteSpace:string]

/**
 过滤字符串首部的空格
 
 @param string 要过滤的字符串
 @return 返回过滤掉首部空格后的字符串
 */
#define CLStringFilterLeadingWhiteSpace(string) [CLStringTool cl_stringFilterLeadingWhiteSpace:string]

/**
 字符串转NSInteger

 @param string 要转为NSInteger的字符串
 @return NSInteger
 */
#define CLStringToNSInteger(string) [CLStringTool cl_stringToNSInteger:string]

/**
 字符串转CGFloat
 
 @param string 要转为CGFloat的字符串
 @return CGFloat
 */
#define CLStringToFloat(string) [CLStringTool cl_stringToFloat:string]

/**
 字符串转Double
 
 @param string 要转为Double的字符串
 @return Double
 */
#define CLStringToDouble(string) [CLStringTool cl_stringToDouble:string]

/**
 字符串转Bool
 
 @param string 要转为Bool的字符串
 @return Bool
 */
#define CLStringToBool(string) [CLStringTool cl_stringToBool:string]

/**
 NSInteger转字符串
 
 @param integerValue 要转为字符串的NSInteger
 @return NSString
 */
#define CLStringFromNSInteger(integerValue) [CLStringTool cl_stringFromNSInteger:integerValue]

/**
 CGFloat转字符串
 
 @param floatValue 要转为字符串的CGFloat
 @return NSString
 */
#define CLStringFromCGFloat(floatValue) [CLStringTool cl_stringFromCGFloat:floatValue]

/**
 Double转字符串
 
 @param doubleValue 要转为字符串的Double
 @return NSString
 */
#define CLStringFromDouble(doubleValue) [CLStringTool cl_stringFromDouble:doubleValue]

/**
 BOOL转字符串
 
 @param boolValue 要转为字符串的BOOL
 @return NSString
 */
#define CLStringFromBool(boolValue) [CLStringTool cl_stringFromBool:boolValue]

/**
 验证字符串是否Email

 @param string 要验证的字符串
 @return 合法的Email地址返回YES，否则返回NO
 */
#define CLStringIsEmail(string) [CLStringTool cl_stringIsValidateEmail:string]

/**
 验证字符串是否电话号码
 
 @param string 要验证的字符串
 @return 合法的电话号码返回YES，否则返回NO
 */
#define CLStringIsPhoneNumber(string) [CLStringTool cl_stringIsValidatePhoneNumber:string]

/**
 验证字符串是否Url
 
 @param string 要验证的字符串
 @return 合法的Url返回YES，否则返回NO
 */
#define CLStringIsUrl(string) [CLStringTool cl_stringIsValidateUrl:string]

/**
 验证字符串是否邮政编码
 
 @param string 要验证的字符串
 @return 合法的邮政编码返回YES，否则返回NO
 */
#define CLStringIsMailCode(string) [CLStringTool cl_stringIsValidateMailCode:string]

/**
 验证字符串是否身份证号
 
 @param string 要验证的字符串
 @return 合法的身份证号返回YES，否则返回NO
 */
#define CLStringIsCardId(string) [CLStringTool cl_stringIsValidateCardId:string]

/**
 验证字符串是否车牌号
 
 @param string 要验证的字符串
 @return 合法的车牌号返回YES，否则返回NO
 */
#define CLStringIsCarNumber(string) [CLStringTool cl_stringIsValidateCarNumber:string]

/**
 验证字符串是否车牌号
 
 @param string 要验证的字符串
 @return 合法的车牌号返回YES，否则返回NO
 */
#define CLStringIsCarNumber(string) [CLStringTool cl_stringIsValidateCarNumber:string]

/**
 验证字符串同时包含数字和字母
 
 @param string 要验证的字符串
 @return 符合规则返回YES，否则返回NO
 */
#define CLStringHasCharAndNumber(string) [CLStringTool cl_stringHasCharAndNumber:string]

/**
 验证字符串同时包含数字和大写字母
 
 @param string 要验证的字符串
 @return 符合规则返回YES，否则返回NO
 */
#define CLStringHasCapitalCharAndNumber(string) [CLStringTool cl_stringHasCapitalCharAndNumber:string]

/**
 验证字符串是否包含表情
 
 @param string 要验证的字符串
 @return 包含有表情返回YES，否则返回NO
 */
#define CLStringHasEmoji(string) [CLStringTool cl_stringHasEmoji:string]

/**
 获取当前时间戳字符串
 
 @return 当前时间的时间戳
 */
#define CLStringCurrentTimeStamp [CLStringTool cl_stringCurrentTimeStamp]


