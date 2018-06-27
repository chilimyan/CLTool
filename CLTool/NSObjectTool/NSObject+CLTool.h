//
//  NSObject+CLTool.h
//  CLProgressTip
//
//  Created by Apple on 2018/2/1.
//  Copyright © 2018年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (CLTool)

/**
 从默认RootVC获取当前控制器
 
 @return 获取当前控制器
 */
- (UIViewController *)getCurrentVC;

/**
 从RootVC获取当前控制器
 
 @param rootVC RootVC
 @return 当前控制器
 */
- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC;

@end
