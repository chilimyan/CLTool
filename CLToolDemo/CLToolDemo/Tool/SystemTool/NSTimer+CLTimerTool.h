//
//  NSTimer+CLTimerTool.h
//  vwork
//
//  Created by Apple on 2018/6/13.
//  Copyright © 2018年 redsea. All rights reserved.
//使用Block来处理事件，防止循环引用

#import <Foundation/Foundation.h>

@interface NSTimer (CLTimerTool)

///自动加入Runloop，默认是defaultModel
+ (NSTimer *)cl_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats;
///手动加入Runloop，自己设定Runloopmodel，一般是CommonModel，这样不会受UI的影响
+ (NSTimer *)cl_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats;

@end
