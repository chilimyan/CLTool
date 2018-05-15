//
//  NSObject+CLTool.m
//  CLProgressTip
//
//  Created by Apple on 2018/2/1.
//  Copyright © 2018年 chilim. All rights reserved.
//

#import "NSObject+CLTool.h"

@implementation NSObject (CLTool)

- (UIViewController *)getCurrentVC{
    UIViewController *root = (UIViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    return [self getCurrentVCFrom:root];
}

- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    
    return currentVC;
}

@end
