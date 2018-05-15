//
//  CLFileTool.m
//  TIMDemo
//
//  Created by Apple on 2017/12/27.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLFileTool.h"

@implementation CLFileTool

+ (NSString *)cl_mainBundlePath:(NSString*)fileName{
    if ([CLStringTool cl_stringIsNull:fileName]) {
        return nil;
    }
    NSArray *fileArray = [fileName componentsSeparatedByString:@"."];
    if (fileArray.count < 2) {
        return nil;
    }
    return [[NSBundle mainBundle]  pathForResource:fileArray[0] ofType:fileArray[1]];
}

+ (NSString *)cl_bundle:(NSString *)bundle file:(NSString *)file
{
    if ([CLStringTool cl_stringIsNull:bundle] || [CLStringTool cl_stringIsNull:file]) {
        return nil;
    }
    return [bundle stringByAppendingPathComponent:file];
}

+ (NSString *)cl_getDocumentPath
{
    NSArray *userPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [userPaths objectAtIndex:0];
}

+ (NSString *)cl_getCachePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+ (NSString *)cl_getTemporaryPath
{
    return NSTemporaryDirectory();
}

+ (NSString *)cl_getFileDocumentPath:(NSString *)fileName{
    if (CLStringIsNull(fileName))
    {
        return nil;
    }
    NSString *documentDirectory = [CLFileTool cl_getDocumentPath];
    NSString *fileFullPath = [documentDirectory stringByAppendingPathComponent:fileName];
    return fileFullPath;
}

+ (NSString *)cl_getFileCachePath:(NSString *)fileName{
    if (CLStringIsNull(fileName))
    {
        return nil;
    }
    NSString *cacheDirectory = [CLFileTool cl_getCachePath];
    NSString *fileFullPath = [cacheDirectory stringByAppendingPathComponent:fileName];
    return fileFullPath;
}

+ (NSString *)cl_getFileResourcePath:(NSString *)fileName{
    if (CLStringIsNull(fileName))
    {
        return nil;
    }
    // 获取资源目录路径
    NSString *resourceDir = [[NSBundle mainBundle] resourcePath];
    return [resourceDir stringByAppendingPathComponent:fileName];
}

+ (BOOL)cl_isExistFileInDocument:(NSString *)fileName
{
    if (CLStringIsNull(fileName))
    {
        return NO;
    }
    
    NSString *filePath = [CLFileTool cl_getFileDocumentPath:fileName];
    if (CLStringIsNull(filePath))
    {
        return NO;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:filePath];
}

+ (BOOL)cl_isExistFileInCache:(NSString *)fileName
{
    if (CLStringIsNull(fileName))
    {
        return NO;
    }
    NSString *filePath = [CLFileTool cl_getFileCachePath:fileName];
    if (CLStringIsNull(filePath))
    {
        return NO;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:filePath];
}

+ (BOOL)cl_isExistFile:(NSString *)aFilePath
{
    if (CLStringIsNull(aFilePath))
    {
        return NO;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:aFilePath];
}

+ (BOOL)cl_removeFolderInDocumet:(NSString *)aFolderNameInDoc
{
    if (CLStringIsNull(aFolderNameInDoc))
    {
        return YES ;
    }
    NSString *filePath = [CLFileTool cl_getFileDocumentPath:aFolderNameInDoc];
    if (CLStringIsNull(filePath))
    {
        return YES;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager removeItemAtPath:filePath error:nil];
}

+ (BOOL)cl_removeFolderInCahe:(NSString *)aFolderNameInCahe
{
    if (CLStringIsNull(aFolderNameInCahe))
    {
        return YES ;
    }
    
    if (![CLFileTool cl_isExistFileInCache:aFolderNameInCahe]) {
        return YES;
    }
    
    NSString *filePath = [CLFileTool cl_getFileCachePath:aFolderNameInCahe];
    if (CLStringIsNull(filePath))
    {
        return YES;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager removeItemAtPath:filePath error:nil];
}

+ (BOOL)cl_deleteFileAtPath:(NSString *)filePath
{
    if (CLStringIsNull(filePath))
    {
        return NO;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath])
    {
        return [fileManager removeItemAtPath:filePath error:nil];
    }
    NSLog(@"删除的文件不存在");
    return NO;
}

+ (BOOL)cl_copyResourceFileToDocumentPath:(NSString *)resourceName{
    if (CLStringIsNull(resourceName))
    {
        return NO;
    }
    //获取资源文件的存放目录进行
    NSString *resourcePath = [CLFileTool cl_getFileResourcePath:resourceName];
    NSString *documentPath = [CLFileTool cl_getFileDocumentPath:resourceName];
    if (nil == resourcePath || nil == documentPath)
    {
        return NO;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([CLFileTool cl_isExistFile:documentPath])
    {
        // 如果文件已存在， 那么先删除原来的
        [CLFileTool cl_deleteFileAtPath:documentPath];
    }
    
    BOOL succ = [fileManager copyItemAtPath:resourcePath toPath:documentPath error:nil];
    return succ;
}

+ (BOOL)cl_createDirectoryAtDocument:(NSString *)dirName{
    if (CLStringIsNull(dirName))
    {
        return NO;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *dirPath = [CLFileTool cl_getFileDocumentPath:dirName];
    if ([fileManager fileExistsAtPath:dirPath])
    {
        return YES;
    }
    
    BOOL succ = [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
    return succ;
}

+ (BOOL)cl_createDirectoryAtCache:(NSString *)dirName{
    if (CLStringIsNull(dirName))
    {
        return NO;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *dirPath = [CLFileTool cl_getFileCachePath:dirName];
    if ([fileManager fileExistsAtPath:dirPath])
    {
        return YES;
    }
    
    BOOL succ = [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
    return succ;
}

+ (BOOL)cl_createDirectoryAtTemporary:(NSString *)dirName{
    if (CLStringIsNull(dirName))
    {
        return NO;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *tempPath = [CLFileTool cl_getTemporaryPath];
    NSString *dirPath = [NSString stringWithFormat:@"%@/%@", tempPath, dirName];
    if ([fileManager fileExistsAtPath:dirPath])
    {
        return YES;
    }
    
    BOOL succ = [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
    return succ;
}

+ (NSDictionary *)cl_getFileAttributsAtPath:(NSString *)filePath{
    if (CLStringIsNull(filePath))
    {
        return nil;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath] == NO)
    {
        return nil;
    }
    return [fileManager attributesOfItemAtPath:filePath error:nil];
}

+ (long long)cl_getFreeSpaceOfDisk{
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    NSNumber *freeSpace = [fattributes objectForKey:NSFileSystemFreeSize];
    long long space = [freeSpace longLongValue];
    return space;
}

+ (long long)cl_getFileSize:(NSString *)filePath{
    NSDictionary *fileAttributes = [CLFileTool cl_getFileAttributsAtPath:filePath];
    if (fileAttributes)
    {
        NSNumber *fileSize = (NSNumber*)[fileAttributes objectForKey: NSFileSize];
        if (fileSize)
        {
            return [fileSize longLongValue];
        }
    }
    return 0;
}

+ (unsigned long long int)cl_folderSize:(NSString *)folderPath{
    NSFileManager *mgr = [NSFileManager defaultManager];
    NSArray *filesArray = [mgr subpathsOfDirectoryAtPath:folderPath error:nil];
    NSEnumerator *filesEnumerator = [filesArray objectEnumerator];
    NSString *fileName;
    unsigned long long int fileSize = 0;
    
    while (fileName = [filesEnumerator nextObject]) {
        NSDictionary *fileDictionary = [mgr attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:fileName] error:nil];
        fileSize += [fileDictionary fileSize];
    }
    
    return fileSize;
}

+ (BOOL)cl_copySourceFile:(NSString *)sourceFile toDesPath:(NSString *)desPath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 读取文件的信息
    NSData *sourceData = [NSData dataWithContentsOfFile:sourceFile];
    BOOL e = NO;
    if (sourceData)
    {
        e = [fileManager createFileAtPath:desPath contents:sourceData attributes:nil];
    }
    if (e)
    {
        NSLog(@"copySourceFile成功");
    }
    else
    {
        NSLog(@"copySourceFile失败");
    }
    return YES;
}

+ (BOOL)cl_moveSourceFile:(NSString *)sourceFile toDesPath:(NSString *)desPath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    [fileManager moveItemAtPath:sourceFile toPath:desPath error:&error];
    if (error)
    {
        return NO;
    }
    return YES;
}

+ (NSString *)cl_reCorrentPathWithPath:(NSString *)path
{
    if (nil == path)
    {
        return nil;
    }
    NSString *docPath = [CLFileTool cl_getDocumentPath];
    NSRange range = [path rangeOfString:docPath];
    // 没找到正确的document路径
    if (range.length <= 0)
    {
        NSRange docRange = [path rangeOfString:@"Documents/"];
        if (docRange.length > 0)
        {
            NSString *relPath = [path substringFromIndex:docRange.location + docRange.length];
            NSString *newPath = [CLFileTool cl_getFileDocumentPath:relPath];
            return newPath;
        }
    }
    return path;
}

@end
