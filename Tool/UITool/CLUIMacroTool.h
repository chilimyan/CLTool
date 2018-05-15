//
//  CLUIMacroTool.h
//  TIMDemo
//
//  Created by Apple on 2017/12/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLUITool.h"
#import "UIView+CLTool.h"
#import "UIViewController+CLTool.h"
#import "UILabel+CLTool.h"
#import "UIImage+CLTool.h"
/**
 根据十六进制数值获得颜色

 @param hex 十六进制数值
 @return 对应的UIColor
 */
#define CLUIColorWithHex(hex) [CLUITool cl_colorWithHex:hex]

/**
 根据CSS获得颜色
 
 @param hex CSS数值
 @return 对应的UIColor
 */
#define CLUIColorWithCSS(css) [CLUITool cl_colorWithCSS:css]

/**
 根据十六进制字符串获得颜色
 
 @param hex 十六进制字符串
 @return 对应的UIColor
 */
#define CLUIColorWithHexString(string) [CLUITool cl_colorWithHexString:string]

/**
 根据图片名称快速获取图片

 @param imageName 图片名称
 @return 返回图片UIImage
 */
#define CLUIImageWithName(imageName) [CLUITool cl_imageName:imageName]

/**
 修正图片的方向

 @param image 要修正方向的图片
 @return 返回修正方向后的图片
 */
#define CLUIImageFixOretation(image) [CLUITool cl_fixOretationImage:image]

/**
 按指定区域剪切图片

 @param image 要剪切的图片
 @param rect 指定区域
 @return 指定区域的图片
 */
#define CLUIImageGetPartImage(image,rect) [CLUITool cl_partImage:image rect:rect]

