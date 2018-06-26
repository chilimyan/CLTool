//
//  UIImage+CLTool.h
//  TIMDemo
//
//  Created by Apple on 2017/12/26.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CLTool)


/**
 修正图片的方向

 @return <#return value description#>
 */
- (UIImage *)cl_fixOrientation;

/**
 有损压缩图片大小

 @param newSize 要压缩到多大
 @return <#return value description#>
 */
- (UIImage *)cl_clipImage:(CGSize)newSize;

/**
 从Bundle文件获取图片

 @param bundle bundle名称
 @param imageName 图片名称
 @return 返回Image
 */
- (UIImage *)cl_imageFromBundle:(NSString *)bundle imageName:(NSString *)imageName;
@end
