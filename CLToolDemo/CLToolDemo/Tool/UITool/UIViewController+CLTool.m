//
//  UIViewController+CLTool.m
//  TIMDemo
//
//  Created by Apple on 2017/12/6.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "UIViewController+CLTool.h"

@implementation UIViewController (CLBackButtonDid)

- (BOOL)cl_navigationBackButtonWilldid{
    [self.navigationController popViewControllerAnimated:YES];
    return NO;
}

@end

@implementation UINavigationController (CLBackButtonDid)

///拦截ViewController中的返回按钮
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem*)item {
    if([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    BOOL shouldPop = YES;
    UIViewController* vc = [self topViewController];
    if([vc respondsToSelector:@selector(cl_navigationBackButtonWilldid)]) {
        shouldPop = [vc cl_navigationBackButtonWilldid];
    }
    if(shouldPop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    } else {
        for(UIView *subview in [navigationBar subviews]) {
            if(subview.alpha < 1.) {
                [UIView animateWithDuration:.25 animations:^{
                    subview.alpha = 1.;
                }];
            }
        }
    }
    return NO;
}

@end

@implementation UIViewController (CLTool)


@end
