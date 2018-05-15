
//
//  CLSecurityMacroTool.h
//  TIMDemo
//
//  Created by Apple on 2017/12/6.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLSecurityTool.h"
#import "NSData+CLGZIPTool.h"

/**
 字符串转为MD5编码
 
 @param string 要MD5的字符串
 @return MD5编码后的字符串
 */
#define CLSecurityMD5Encode(string) [CLSecurityTool cl_stringMD5Encode:string]
