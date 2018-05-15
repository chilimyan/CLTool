//
//  CLFileTool.h
//  TIMDemo
//
//  Created by Apple on 2017/12/27.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLStringMacroTool.h"

@interface CLFileTool : NSObject

+ (NSString *)cl_mainBundlePath:(NSString*)fileName;

+ (NSString *)cl_bundle:(NSString *)bundle file:(NSString *)file;

///获取文档目录路径
+ (NSString *)cl_getDocumentPath;

/// 获取cache目录路径
+ (NSString *)cl_getCachePath;

///获取临时目录
+ (NSString *)cl_getTemporaryPath;

/// 获取文件的文档目录路径
+ (NSString *)cl_getFileDocumentPath:(NSString *)fileName;

/// 获取文件在cache目录的路径
+ (NSString *)cl_getFileCachePath:(NSString *)fileName;

/// 获取资源文件的路径
+ (NSString *)cl_getFileResourcePath:(NSString *)fileName;

/// 判断一个文件是否存在于document目录下
+ (BOOL)cl_isExistFileInDocument:(NSString *)fileName;

/// 判断一个文件是否存在于cache目录下
+ (BOOL)cl_isExistFileInCache:(NSString *)fileName;

/// 判断一个全路径文件是否存在
+ (BOOL)cl_isExistFile:(NSString *)aFilePath;

/// 删除document目录下的一个文件夹
+ (BOOL)cl_removeFolderInDocumet:(NSString *)aFolderNameInDoc;

/// 删除cache目录下的一个文件夹
+ (BOOL)cl_removeFolderInCahe:(NSString *)aFolderNameInCahe;

///删除一个全路径文件
+ (BOOL)cl_deleteFileAtPath:(NSString *)filePath;

/// 将资源文件拷贝到文档目录下
+ (BOOL)cl_copyResourceFileToDocumentPath:(NSString *)resourceName;

/// 在document目录下创建一个目录
+ (BOOL)cl_createDirectoryAtDocument:(NSString *)dirName;

/// 在cache目录下创建一个目录
+ (BOOL)cl_createDirectoryAtCache:(NSString *)dirName;

/// 在临时目录下创建一个目录
+ (BOOL)cl_createDirectoryAtTemporary:(NSString *)dirName;

/// 获取文件的属性集合
+ (NSDictionary *)cl_getFileAttributsAtPath:(NSString *)filePath;

/// 获取磁盘剩余空间的大小
+ (long long)cl_getFreeSpaceOfDisk;

///获取文件大小
+ (long long)cl_getFileSize:(NSString *)filePath;

///获取文件夹大小
+ (unsigned long long int)cl_folderSize:(NSString *)folderPath;

///将指定文件拷贝到指定地方
+ (BOOL)cl_copySourceFile:(NSString *)sourceFile toDesPath:(NSString *)desPath;

///将指定文件移动到指定地方
+ (BOOL)cl_moveSourceFile:(NSString *)sourceFile toDesPath:(NSString *)desPath;

///// 如果应用程序覆盖安装后，其document目录会发生变化，该函数用于替换就的document路径
+ (NSString *)cl_reCorrentPathWithPath:(NSString *)path;

@end
