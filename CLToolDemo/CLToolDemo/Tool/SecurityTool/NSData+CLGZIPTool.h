//
//  NSData+CLGZIPTool.h
//  TIMDemo
//  Distributed under the permissive zlib License
//  Get the latest version from here:
//
//  https://github.com/nicklockwood/GZIP
//  Created by Apple on 2017/12/6.
//  Copyright © 2017年 chilim. All rights reserved.
//
// gzip压缩加密解密工具

#import <Foundation/Foundation.h>

@interface NSData (CLGZIPTool)

///对当前data进行gzip压缩加密
- (nullable NSData *)cl_gzippedData;

///解压当前gzip加密的Data
- (nullable NSData *)cl_gunzippedData;

///当前data是否已经gzip压缩加密
- (BOOL)cl_isGzippedData;

@end
