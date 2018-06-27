//
//  CLKeyChainTool.h
//  TIMDemo
//
//  Created by Apple on 2017/12/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLKeyChainTool : NSObject

/**
 保存数据到钥匙串
 
 @param data 要保存的数据
 @param service key
 */
+ (void)cl_saveData:(id)data service:(NSString *)service;

/**
 从钥匙串获取数据
 
 @param service key
 @return 返回data
 */
+ (id)cl_loadData:(NSString *)service;
/**
 从钥匙串删除数据
 
 @param service key
 */
+ (void)cl_deleteData:(NSString *)service;



@end
