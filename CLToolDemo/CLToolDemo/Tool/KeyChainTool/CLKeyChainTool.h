//
//  CLKeyChainTool.h
//  TIMDemo
//
//  Created by Apple on 2017/12/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLKeyChainTool : NSObject

+ (void)cl_saveData:(id)data service:(NSString *)service;

+ (id)cl_loadData:(NSString *)service;

+ (void)cl_deleteData:(NSString *)service;


@end
