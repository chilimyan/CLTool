//
//  UIImage+CLTool.h
//  TIMDemo
//
//  Created by Apple on 2017/12/26.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CLTool)

- (UIImage *)cl_fixOrientation;

- (UIImage *)cl_clipImage:(CGSize)newSize;

@end
