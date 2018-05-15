//
//  NSObject+CLBlockTool.h
//  TIMDemo
//
//  Created by Apple on 2017/12/26.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CLCommonVoidBlock)(void);

typedef void (^CLCommonBlock)(id selfPtr);

typedef void (^CLCommonCompletionBlock)(id selfPtr, BOOL isFinished);

@interface NSObject (CLBlockTool)

- (void)cl_excuteBlock:(CLCommonBlock)block;

- (void)cl_performBlock:(CLCommonBlock)block;

- (void)cl_performBlock:(CLCommonBlock)block afterDelay:(NSTimeInterval)delay;

- (void)cl_excuteCompletionBlock:(CLCommonCompletionBlock)block finished:(NSNumber *)finished;

- (void)cl_performCompletionBlock:(CLCommonCompletionBlock)block finished:(BOOL)finished;

/// 并发执行tasks里的作务，等tasks执行行完毕，回调到completion
- (void)cl_asynExecuteCompletionBlock:(CLCommonBlock)completion tasks:(CLCommonBlock)task, ... NS_REQUIRES_NIL_TERMINATION;

@end
