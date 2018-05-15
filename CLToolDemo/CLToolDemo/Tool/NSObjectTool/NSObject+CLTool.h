//
//  NSObject+CLTool.h
//  CLProgressTip
//
//  Created by Apple on 2018/2/1.
//  Copyright © 2018年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CLTool)

- (UIViewController *)getCurrentVC;
- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC;

@end
