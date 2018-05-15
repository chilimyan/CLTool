//
//  CLUITool.h
//  TIMDemo
//
//  Created by Apple on 2017/12/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLUITool : NSObject

///===============UIColor===============///
+ (UIColor *)cl_colorWithHex:(NSInteger)hex;

+ (UIColor *)cl_colorWithCSS:(NSString *)css;

+ (UIColor *)cl_colorWithHexString:(NSString *)string;

///===============UIImage===============///
+ (UIImage *)cl_imageName:(NSString *)imageName;

+ (UIImage *)cl_fixOretationImage:(UIImage *)image;

+ (UIImage *)cl_partImage:(UIImage *)image rect:(CGRect)rect;


@end

