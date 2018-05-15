//
//  NSObject+CLBlockTool.m
//  TIMDemo
//
//  Created by Apple on 2017/12/26.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "NSObject+CLBlockTool.h"

@implementation NSObject (CLBlockTool)


- (void)cl_cancelBlock:(CLCommonBlock)block
{
    [[NSRunLoop currentRunLoop] cancelPerformSelector:@selector(cl_excuteBlock:) target:self argument:block];
}

- (void)cl_cancelCompletion:(CLCommonCompletionBlock)block
{
    [[NSRunLoop currentRunLoop] cancelPerformSelector:@selector(cl_excuteCompletionBlock:finished:) target:self argument:block];
}

- (void)cl_excuteBlock:(CLCommonBlock)block{
    __weak id selfPtr = self;
    if (block) {
        block(selfPtr);
    }
}

- (void)cl_performBlock:(CLCommonBlock)block{
    if (block)
    {
        [self performSelector:@selector(cl_excuteBlock:) withObject:block];
    }
}

- (void)cl_performBlock:(CLCommonBlock)block afterDelay:(NSTimeInterval)delay{
    if (block)
    {
        [self performSelector:@selector(cl_excuteBlock:) withObject:block afterDelay:delay];
    }
}

- (void)cl_excuteCompletionBlock:(CLCommonCompletionBlock)block finished:(NSNumber *)finished{
    __weak id selfPtr = self;
    if (block) {
        block(selfPtr, finished.boolValue);
    }
}

- (void)cl_performCompletionBlock:(CLCommonCompletionBlock)block finished:(BOOL)finished{
    if (block)
    {
        [self performSelector:@selector(cl_excuteCompletionBlock:finished:) withObject:block withObject:[NSNumber numberWithBool:finished]];
    }
}

/// 并发执行tasks里的作务，等tasks执行行完毕，回调到completion
- (void)cl_asynExecuteCompletionBlock:(CLCommonBlock)completion tasks:(CLCommonBlock)task, ... NS_REQUIRES_NIL_TERMINATION{
    va_list arguments;
    
    if (task)
    {
        if (task)
        {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                if (task)
                {
                    task(self);
                }
            });
            
            va_start(arguments, task);
            NSLog(@"%@ <<<<<<<<<=============", task);
            BOOL next = YES;
            do
            {
                CLCommonBlock eachObject = va_arg(arguments, CLCommonBlock);
                NSLog(@"%@ <<<<<<<<<=============", eachObject);
                if (eachObject)
                {
                    dispatch_async(dispatch_get_global_queue(0, 0), ^{
                        if (eachObject)
                        {
                            eachObject(self);
                        }
                    });
                }
                else
                {
                    next = NO;
                }
                
            }while (next);
            va_end(arguments);
        }
        
        dispatch_barrier_async(dispatch_get_global_queue(0, 0), ^{
            if (completion)
            {
                completion(self);
            }
        });
    }
}

@end
