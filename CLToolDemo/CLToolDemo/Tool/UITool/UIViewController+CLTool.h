//
//  UIViewController+CLTool.h
//  TIMDemo
//
//  Created by Apple on 2017/12/6.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CLBackButtonProtocol

@optional

///在ViewController里面实现这个方法用以拦截返回按钮事件
- (BOOL)cl_navigationBackButtonWilldid;

@end

@interface UINavigationController (CLBackButtonDid)


@end

@interface UIViewController (CLTool)


@end
