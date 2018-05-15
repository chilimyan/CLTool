//
//  CLSecurityTool.m
//  TIMDemo
//
//  Created by Apple on 2017/12/6.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLSecurityTool.h"
#import <CommonCrypto/CommonDigest.h>

@implementation CLSecurityTool

+ (BOOL)cl_stringMD5Encode:(NSString *)string{
    const char* aString = [string UTF8String];
    unsigned char result[16];
    CC_MD5(aString, (unsigned int)strlen(aString), result);
    NSString* hash = [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                      result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
                      result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]];
    
    return [hash lowercaseString];
}

@end
