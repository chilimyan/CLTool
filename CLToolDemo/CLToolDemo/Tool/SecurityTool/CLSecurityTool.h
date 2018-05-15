//
//  CLSecurityTool.h
//  TIMDemo
//
//  Created by Apple on 2017/12/6.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLSecurityTool : NSObject

+ (BOOL)cl_stringMD5Encode:(NSString *)string;

@end
