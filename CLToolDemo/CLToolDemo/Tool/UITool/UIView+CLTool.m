//
//  UIView+CLTool.m
//  TIMDemo
//
//  Created by Apple on 2017/12/6.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "UIView+CLTool.h"

@implementation UIView (CLTool)

- (UIViewController *)getCurrentVC{
    UIView* next = [self superview];
    while(next){
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
        next =next.superview;
    }
    return (UIViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (UIView *)cl_top:(CGFloat)margin
{
    IsSuperViewInvalid(self);
    CGRect supRect = self.superview.bounds;
    CGRect rect = self.frame;
    rect.origin.y = supRect.origin.y + margin;
    self.frame = rect;
    return self;
}
- (UIView *)cl_bottom:(CGFloat)margin
{
    IsSuperViewInvalid(self);
    CGRect supRect = self.superview.bounds;
    CGRect rect = self.frame;
    rect.origin.y = supRect.origin.y + supRect.size.height - margin - rect.origin.y;
    self.frame = rect;
    return self;
}
- (UIView *)cl_left:(CGFloat)margin
{
    IsSuperViewInvalid(self);
    CGRect supRect = self.superview.bounds;
    CGRect rect = self.frame;
    rect.origin.x = supRect.origin.x + margin;
    self.frame = rect;
    return self;
}
- (UIView *)cl_right:(CGFloat)margin
{
    IsSuperViewInvalid(self);
    CGRect supRect = self.superview.bounds;
    CGRect rect = self.frame;
    rect.origin.x = supRect.origin.x + supRect.size.width - margin - rect.size.width;
    self.frame = rect;
    return self;
}

- (UIView *)cl_top:(CGFloat)top bottom:(CGFloat)bottom left:(CGFloat)left right:(CGFloat)right
{
    IsSuperViewInvalid(self);
    CGRect superBounds = self.superview.bounds;
    CGRect rect = CGRectZero;
    rect.origin.y = top;
    rect.size.height = superBounds.origin.y + superBounds.size.height - rect.origin.y - bottom;
    
    rect.origin.x = left;
    rect.size.width = superBounds.origin.x + superBounds.size.width - rect.origin.x - right;
    
    self.frame = rect;
    return self;
}

- (UIView *)cl_edgeInsets:(UIEdgeInsets)inset{
    return [self cl_top:inset.top bottom:inset.bottom left:inset.left right:inset.right];
}

- (UIView *)cl_center:(CGPoint)margin{
    IsSuperViewInvalid(self);
    CGRect sbounds = self.superview.bounds;
    CGPoint center = CGPointMake(CGRectGetMidX(sbounds), CGRectGetMidY(sbounds));
    center.x += margin.x;
    center.y += margin.y;
    self.center = center;
    return self;
}

- (UIView *)cl_horizontal:(CGFloat)margin{
    IsSuperViewInvalid(self);
    CGRect supRect = self.superview.bounds;
    CGRect rect = self.frame;
    rect.origin.x = supRect.origin.x + margin;
    rect.size.width = supRect.size.width - 2 * margin;
    self.frame = rect;
    return self;
}

- (UIView *)cl_vertical:(CGFloat)margin{
    IsSuperViewInvalid(self);
    CGRect supRect = self.superview.bounds;
    CGRect rect = self.frame;
    rect.origin.y = supRect.origin.y + margin;
    rect.size.height = supRect.size.height - 2 * margin;
    self.frame = rect;
    return self;
}

- (UIView *)cl_alignHorizontalCenter{
    IsSuperViewInvalid(self);
    CGPoint center = CGPointZero;
    CGRect srect = self.superview.bounds;
    center.y = self.center.y;
    center.x = CGRectGetMidX(srect);
    self.center = center;
    return self;
}

- (UIView *)cl_alignVerticalCenter{
    IsSuperViewInvalid(self);
    CGPoint center = CGPointZero;
    center.x = self.center.x;
    CGRect srect = self.superview.bounds;
    center.y = CGRectGetMidY(srect);
    self.center = center;
    return self;
}
- (UIView *)cl_alignCenter{
    IsSuperViewInvalid(self);
    CGRect rect = self.superview.bounds;
    self.center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    return self;
}

- (UIView *)cl_alignTop{
    return [self cl_top:0];
}

- (UIView *)cl_alignBottom{
    return [self cl_bottom:0];
}

- (UIView *)cl_alignLeft{
    return [self cl_left:0];
}

- (UIView *)cl_alignRight{
    return [self cl_right:0];
}

- (UIView *)cl_above:(UIView *)referView margin:(CGFloat)margin{
    IsArgInvalid(self, referView);
    CGRect rect = self.frame;
    CGRect brect = referView.frame;
    rect.origin.y = brect.origin.y - margin - rect.size.height;
    self.frame = rect;
    return self;
}
- (UIView *)cl_below:(UIView *)referView margin:(CGFloat)margin{
    IsArgInvalid(self, referView);
    CGRect rect = self.frame;
    CGRect brect = referView.frame;
    rect.origin.y = brect.origin.y + brect.size.height + margin;
    self.frame = rect;
    return self;
}
- (UIView *)cl_leftOf:(UIView *)referView margin:(CGFloat)margin{
    IsArgInvalid(self, referView);
    CGRect rect = self.frame;
    CGRect brect = referView.frame;
    rect.origin.x = brect.origin.x + margin;
    self.frame = rect;
    return self;
}
- (UIView *)cl_rightOf:(UIView *)referView margin:(CGFloat)margin{
    IsArgInvalid(self, referView);
    CGRect rect = self.frame;
    CGRect brect = referView.frame;
    rect.origin.x = brect.origin.x + brect.size.width - margin - rect.size.width;
    self.frame = rect;
    return self;
}

- (UIView *)cl_alignAbove:(UIView *)referView{
    return [self cl_above:referView margin:0];
}
- (UIView *)cl_alignBelow:(UIView *)referView{
    return [self cl_below:referView margin:0];
}
- (UIView *)cl_alignLeftOf:(UIView *)referView{
    return [self cl_leftOf:referView margin:0];
}
- (UIView *)cl_alignRightOf:(UIView *)referView{
    return [self cl_rightOf:referView margin:0];
}

- (UIView *)cl_scaleRight:(CGFloat)margin{
    IsSuperViewInvalid(self);
    CGRect sRect = self.superview.bounds;
    CGRect rect = self.frame;
    rect.size.width = sRect.origin.x + sRect.size.width - margin - rect.origin.x;
    self.frame = rect;
    return self;
}
- (UIView *)cl_scaleLeft:(CGFloat)margin{
    IsSuperViewInvalid(self);
    CGRect sRect = self.superview.bounds;
    CGRect rect = self.frame;
    rect.size.width = rect.origin.x + rect.size.width - (sRect.origin.x + margin);
    rect.origin.x = sRect.origin.x + margin;
    self.frame = rect;
    return self;
}
- (UIView *)cl_scaleBottom:(CGFloat)margin{
    IsSuperViewInvalid(self);
    CGRect sRect = self.superview.bounds;
    CGRect rect = self.frame;
    rect.size.height = sRect.origin.y + sRect.size.height - margin - rect.origin.y;
    self.frame = rect;
    return self;
}
- (UIView *)cl_scaleTop:(CGFloat)margin{
    IsSuperViewInvalid(self);
    CGRect sRect = self.superview.bounds;
    CGRect rect = self.frame;
    rect.size.height = rect.origin.y + rect.size.height - (sRect.origin.y + margin);
    rect.origin.y = sRect.origin.y + margin;
    self.frame = rect;
    return self;
}
- (UIView *)cl_scaleAlignRight{
    return [self cl_scaleRight:0];
}
- (UIView *)cl_scaleAlignLeft{
    return [self cl_scaleLeft:0];
}
- (UIView *)cl_scaleAlignBottom{
    return [self cl_scaleBottom:0];
}
- (UIView *)cl_scaleAlignTop{
    return [self cl_scaleTop:0];
}

- (UIView *)cl_scaleAbove:(UIView *)referView margin:(CGFloat)margin{
    IsArgInvalid(self, referView);
    CGRect rect = self.frame;
    CGRect brect = referView.frame;
    
    if (brect.origin.y > rect.origin.y)
    {
        rect.size.height = brect.origin.y - margin - rect.origin.y;
    }
    else
    {
        rect.size.height =  rect.origin.y + rect.size.height - (brect.origin.y + margin);
        rect.origin.y = brect.origin.y + margin;
    }
    self.frame = rect;
    return self;
}
- (UIView *)cl_scaleBelow:(UIView *)referView margin:(CGFloat)margin{
    IsArgInvalid(self, referView);
    CGRect rect = self.frame;
    CGRect brect = referView.frame;
    
    if (rect.origin.y < brect.origin.y + brect.size.height) {
        rect.size.height =  brect.origin.y + brect.size.height - margin - rect.origin.y;
    }
    else
    {
        rect.size.height =  rect.origin.y + rect.size.height - (margin + brect.origin.y + brect.size.height);
        rect.origin.y = (margin + brect.origin.y + brect.size.height);
    }
    self.frame = rect;
    return self;
}
- (UIView *)cl_scaleLeftOf:(UIView *)referView margin:(CGFloat)margin{
    IsArgInvalid(self, referView);
    CGRect rect = self.frame;
    CGRect brect = referView.frame;
    
    if (rect.origin.x < brect.origin.x)
    {
        rect.size.width = brect.origin.x - margin - rect.origin.x;
    }
    else
    {
        rect.size.width = rect.origin.x + rect.size.width - (margin + brect.origin.x);
        rect.origin.x = brect.origin.x + margin;
    }
    self.frame = rect;
    return self;
}
- (UIView *)cl_scaleRightOf:(UIView *)referView margin:(CGFloat)margin{
    IsArgInvalid(self, referView);
    CGRect rect = self.frame;
    CGRect brect = referView.frame;
    
    if (rect.origin.x < brect.origin.x + brect.size.width)
    {
        rect.size.width = brect.origin.x + brect.size.width - margin - rect.origin.x;
    }
    else
    {
        rect.size.width = rect.origin.x + rect.size.width - (brect.origin.x + brect.size.width - margin);
        rect.origin.x = brect.origin.x + brect.size.width - margin;
    }
    self.frame = rect;
    return self;
}
- (UIView *)cl_scaleAlignAbove:(UIView *)referView{
    return [self cl_scaleAbove:referView margin:0];
}
- (UIView *)cl_scaleAlignBelow:(UIView *)referView{
    return [self cl_scaleBelow:referView margin:0];
}
- (UIView *)cl_scaleAlignLeftOf:(UIView *)referView{
    return [self cl_scaleLeftOf:referView margin:0];
}
- (UIView *)cl_scaleAlignRightOf:(UIView *)referView{
    return [self cl_scaleRightOf:referView margin:0];
}

@end


static NSString * const CLCornerPositionKey = @"CLCornerPositionKey";
static NSString * const CLCornerRadiusKey = @"CLCornerRadiusKey";

@implementation UIView (CLCorner)

@dynamic cl_cornerPosition;
@dynamic cl_cornerRadius;

- (CLCornerPosition)cl_cornerPosition{
    return [objc_getAssociatedObject(self, &CLCornerPositionKey) integerValue];
}

- (void)setCl_cornerPosition:(CLCornerPosition)cl_cornerPosition{
    objc_setAssociatedObject(self, &CLCornerPositionKey, @(cl_cornerPosition), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)cl_cornerRadius{
    return [objc_getAssociatedObject(self, &CLCornerRadiusKey) floatValue];
}

- (void)setCl_cornerRadius:(CGFloat)cl_cornerRadius{
    objc_setAssociatedObject(self, &CLCornerRadiusKey, @(cl_cornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        layout_swizzleMethod(class, @selector(layoutSublayersOfLayer:), @selector(aop_layoutSublayersOfLayer:));
    });
}

void layout_swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)   {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)aop_layoutSublayersOfLayer:(CALayer *)layer
{
    [self aop_layoutSublayersOfLayer:layer];
    
    if (self.cl_cornerRadius > 0) {
        
        UIBezierPath *maskPath;
        switch (self.cl_cornerPosition) {
            case CLCornerPositionTop:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                                       cornerRadii:CGSizeMake(self.cl_cornerRadius, self.cl_cornerRadius)];
                break;
            case CLCornerPositionLeft:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft)
                                                       cornerRadii:CGSizeMake(self.cl_cornerRadius, self.cl_cornerRadius)];
                break;
            case CLCornerPositionBottom:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight)
                                                       cornerRadii:CGSizeMake(self.cl_cornerRadius, self.cl_cornerRadius)];
                break;
            case CLCornerPositionRight:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:(UIRectCornerTopRight | UIRectCornerBottomRight)
                                                       cornerRadii:CGSizeMake(self.cl_cornerRadius, self.cl_cornerRadius)];
                break;
            case CLCornerPositionAll:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:UIRectCornerAllCorners
                                                       cornerRadii:CGSizeMake(self.cl_cornerRadius, self.cl_cornerRadius)];
                break;
        }
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
    }
}

- (void)cl_setCornerOnTopWithRadius:(CGFloat)radius{
    self.cl_cornerRadius = radius;
    self.cl_cornerPosition = CLCornerPositionTop;
}
- (void)cl_setCornerOnLeftWithRadius:(CGFloat)radius{
    self.cl_cornerRadius = radius;
    self.cl_cornerPosition = CLCornerPositionLeft;
}
- (void)cl_setCornerOnBottomWithRadius:(CGFloat)radius{
    self.cl_cornerRadius = radius;
    self.cl_cornerPosition = CLCornerPositionBottom;
}
- (void)cl_setCornerOnRightWithRadius:(CGFloat)radius{
    self.cl_cornerRadius = radius;
    self.cl_cornerPosition = CLCornerPositionRight;
}
- (void)cl_setAllCornerWithCornerRadius:(CGFloat)radius{
    self.cl_cornerRadius = radius;
    self.cl_cornerPosition = CLCornerPositionAll;
}
- (void)cl_setNoneCorner{
    self.layer.mask = nil;
}


@end
