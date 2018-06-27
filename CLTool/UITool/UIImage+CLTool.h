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
 纠正图片的方向
 
 @return 新的Image
 */
- (UIImage *)cl_fixOrientation;

- (UIImage *)cl_clipImage:(CGSize)newSize;

/**
 按给定的方向旋转图片
 
 @return 新的Image
 */
- (UIImage*)cl_rotate:(UIImageOrientation)orient;

/**
 垂直翻转
 
 @return 新的Image
 */
- (UIImage *)cl_flipVertical;

/**
 水平翻转
 
 @return 新的Image
 */
- (UIImage *)cl_flipHorizontal;

/**
 将图片旋转degrees角度
 
 @return 新的Image
 */
- (UIImage *)cl_imageRotatedByDegrees:(CGFloat)degrees;

/**
 将图片旋转radians弧度
 
 @return 新的Image
 */
- (UIImage *)cl_imageRotatedByRadians:(CGFloat)radians;

/**
 获取某一个空间的截屏
 
 @return 新的Image
 */
+(UIImage *)cl_screenShotsOfView:(UIView *)view;

/**
 从Bundle文件获取图片

 @param bundle bundle名称
 @param imageName 图片名称
 @return 返回Image
 */
+ (UIImage *)cl_imageFromBundle:(NSString *)bundle imageName:(NSString *)imageName;
@end
