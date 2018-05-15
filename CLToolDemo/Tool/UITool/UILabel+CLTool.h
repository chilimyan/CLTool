//
//  UILabel+CLTool.h
//  TIMDemo
//
//  Created by Apple on 2017/12/22.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CLTool)

/**
 计算文本大小

 @param size 最大Size
 @return 在最大size中的大小
 */
- (CGSize)cl_textSizeIn:(CGSize)size;

@end
