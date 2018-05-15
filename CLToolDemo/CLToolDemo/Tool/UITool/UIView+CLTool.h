//
//  UIView+CLTool.h
//  TIMDemo
//
//  Created by Apple on 2017/12/6.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#ifdef DEBUG

#define IsArgInvalid(curView, brotherView) NSAssert((self.superview == brotherView.superview) && !(CGRectEqualToRect(brotherView.frame, CGRectZero)), @"UIView (CustomAutoLayout)参数出错")
#define IsSuperViewInvalid(curView) NSAssert((self.superview != nil), @"UIView (CustomAutoLayout)父控件没有设置参数出错")

#else

#define IsArgInvalid(curView, brotherView)
#define IsSuperViewInvalid(curView)

#endif

@interface UIView (CLTool)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

- (UIViewController *)getCurrentVC;

///frame方式的相对布局=======
// 与父控件的相对位置
- (UIView *)cl_top:(CGFloat)margin;
- (UIView *)cl_bottom:(CGFloat)margin;
- (UIView *)cl_left:(CGFloat)margin;
- (UIView *)cl_right:(CGFloat)margin;
- (UIView *)cl_center:(CGPoint)margin;
- (UIView *)cl_horizontal:(CGFloat)margin;
- (UIView *)cl_vertical:(CGFloat)margin;
- (UIView *)cl_top:(CGFloat)top bottom:(CGFloat)bottom left:(CGFloat)left right:(CGFloat)right;
- (UIView *)cl_edgeInsets:(UIEdgeInsets)inset;
// 与父控件对齐方式
- (UIView *)cl_alignHorizontalCenter;
- (UIView *)cl_alignVerticalCenter;
- (UIView *)cl_alignCenter;
- (UIView *)cl_alignTop;
- (UIView *)cl_alignBottom;
- (UIView *)cl_alignLeft;
- (UIView *)cl_alignRight;

// 与父控件上其他控件的相对布局
- (UIView *)cl_above:(UIView *)referView margin:(CGFloat)margin;
- (UIView *)cl_below:(UIView *)referView margin:(CGFloat)margin;
- (UIView *)cl_leftOf:(UIView *)referView margin:(CGFloat)margin;
- (UIView *)cl_rightOf:(UIView *)referView margin:(CGFloat)margin;
// 与父控件上其他控件的对齐方式
- (UIView *)cl_alignAbove:(UIView *)referView;
- (UIView *)cl_alignBelow:(UIView *)referView;
- (UIView *)cl_alignLeftOf:(UIView *)referView;
- (UIView *)cl_alignRightOf:(UIView *)referView;

//与父控件的填充式布局
- (UIView *)cl_scaleRight:(CGFloat)margin;
- (UIView *)cl_scaleLeft:(CGFloat)margin;
- (UIView *)cl_scaleBottom:(CGFloat)margin;
- (UIView *)cl_scaleTop:(CGFloat)margin;
- (UIView *)cl_scaleAlignRight;
- (UIView *)cl_scaleAlignLeft;
- (UIView *)cl_scaleAlignBottom;
- (UIView *)cl_scaleAlignTop;
//与父控件上其他控件的填充式布局
- (UIView *)cl_scaleAbove:(UIView *)referView margin:(CGFloat)margin;
- (UIView *)cl_scaleBelow:(UIView *)referView margin:(CGFloat)margin;
- (UIView *)cl_scaleLeftOf:(UIView *)referView margin:(CGFloat)margin;
- (UIView *)cl_scaleRightOf:(UIView *)referView margin:(CGFloat)margin;
- (UIView *)cl_scaleAlignAbove:(UIView *)referView;
- (UIView *)cl_scaleAlignBelow:(UIView *)referView;
- (UIView *)cl_scaleAlignLeftOf:(UIView *)referView;
- (UIView *)cl_scaleAlignRightOf:(UIView *)referView;


@end

///要加圆角的位置
typedef NS_ENUM(NSInteger, CLCornerPosition) {
    CLCornerPositionTop,
    CLCornerPositionLeft,
    CLCornerPositionBottom,
    CLCornerPositionRight,
    CLCornerPositionAll
};

@interface UIView (CLCorner)

///设置圆角的位置
@property (nonatomic, assign) CLCornerPosition cl_cornerPosition;
///圆角的大小
@property (nonatomic, assign) CGFloat cl_cornerRadius;
///设置上面的圆角
- (void)cl_setCornerOnTopWithRadius:(CGFloat)radius;
///设置左边的圆角
- (void)cl_setCornerOnLeftWithRadius:(CGFloat)radius;
///设置下面的圆角
- (void)cl_setCornerOnBottomWithRadius:(CGFloat)radius;
///设置右边的圆角
- (void)cl_setCornerOnRightWithRadius:(CGFloat)radius;
///设置所有的圆角
- (void)cl_setAllCornerWithCornerRadius:(CGFloat)radius;
///不设置圆角
- (void)cl_setNoneCorner;

@end
