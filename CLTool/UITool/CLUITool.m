//
//  CLUITool.m
//  TIMDemo
//
//  Created by Apple on 2017/12/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLUITool.h"
#import "CLStringTool.h"
#import "CLSystemTool.h"

@implementation CLUITool

+ (UIColor *)cl_colorWithHex:(NSInteger)hex{
    CGFloat red, green, blue, alpha;
    
    red = ((CGFloat)((hex >> 16) & 0xFF)) / ((CGFloat)0xFF);
    green = ((CGFloat)((hex >> 8) & 0xFF)) / ((CGFloat)0xFF);
    blue = ((CGFloat)((hex >> 0) & 0xFF)) / ((CGFloat)0xFF);
    alpha = hex > 0xFFFFFF ? ((CGFloat)((hex >> 24) & 0xFF)) / ((CGFloat)0xFF) : 1;
    
    return [UIColor colorWithRed: red green:green blue:blue alpha:alpha];
}

+ (UIColor *)cl_colorWithCSS:(NSString *)css{
    if (css.length == 0)
        return [UIColor blackColor];
    
    if ([css characterAtIndex:0] == '#')
        css = [css substringFromIndex:1];
    
    NSString *a, *r, *g, *b;
    
    NSUInteger len = css.length;
    if (len == 6) {
    six:
        a = @"FF";
        r = [css substringWithRange:NSMakeRange(0, 2)];
        g = [css substringWithRange:NSMakeRange(2, 2)];
        b = [css substringWithRange:NSMakeRange(4, 2)];
    }
    else if (len == 8) {
    eight:
        a = [css substringWithRange:NSMakeRange(0, 2)];
        r = [css substringWithRange:NSMakeRange(2, 2)];
        g = [css substringWithRange:NSMakeRange(4, 2)];
        b = [css substringWithRange:NSMakeRange(6, 2)];
    }
    else if (len == 3) {
    three:
        a = @"FF";
        r = [css substringWithRange:NSMakeRange(0, 1)];
        r = [r stringByAppendingString:a];
        g = [css substringWithRange:NSMakeRange(1, 1)];
        g = [g stringByAppendingString:a];
        b = [css substringWithRange:NSMakeRange(2, 1)];
        b = [b stringByAppendingString:a];
    }
    else if (len == 4) {
        a = [css substringWithRange:NSMakeRange(0, 1)];
        a = [a stringByAppendingString:a];
        r = [css substringWithRange:NSMakeRange(1, 1)];
        r = [r stringByAppendingString:a];
        g = [css substringWithRange:NSMakeRange(2, 1)];
        g = [g stringByAppendingString:a];
        b = [css substringWithRange:NSMakeRange(3, 1)];
        b = [b stringByAppendingString:a];
    }
    else if (len == 5 || len == 7) {
        css = [@"0" stringByAppendingString:css];
        if (len == 5) goto six;
        goto eight;
    }
    else if (len < 3) {
        css = [CLUITool stringByPaddingTheLeftTo:css length:3 withString:@"0" startingAtIndex:0];
        goto three;
    }
    else if (len > 8) {
        css = [css substringFromIndex:len-8];
        goto eight;
    }
    else {
        a = @"FF";
        r = @"00";
        g = @"00";
        b = @"00";
    }
    
    // parse each component separately. This gives more accurate results than
    // throwing it all together in one string and use scanf on the global string.
    a = [@"0x" stringByAppendingString:a];
    r = [@"0x" stringByAppendingString:r];
    g = [@"0x" stringByAppendingString:g];
    b = [@"0x" stringByAppendingString:b];
    
    uint av, rv, gv, bv;
    sscanf([a cStringUsingEncoding:NSASCIIStringEncoding], "%x", &av);
    sscanf([r cStringUsingEncoding:NSASCIIStringEncoding], "%x", &rv);
    sscanf([g cStringUsingEncoding:NSASCIIStringEncoding], "%x", &gv);
    sscanf([b cStringUsingEncoding:NSASCIIStringEncoding], "%x", &bv);
    
    return [UIColor colorWithRed: rv / 255.f
                           green: gv / 255.f
                            blue: bv / 255.f
                           alpha: av / 255.f];
}

+ (NSString *) stringByPaddingTheLeftTo:(NSString *)string length:(NSUInteger) newLength withString:(NSString *) padString startingAtIndex:(NSUInteger) padIndex
{
    if ([string length] <= newLength)
        return [[@"" stringByPaddingToLength:newLength - [string length] withString:padString startingAtIndex:padIndex] stringByAppendingString:string];
    else
        return [string copy];
}

+ (UIColor *)cl_colorWithHexString:(NSString *)string{
    if (string) {
        string = [string stringByReplacingCharactersInRange:[string rangeOfString:@"#" ] withString:@"0x"];
        long colorLong = strtoul([string cStringUsingEncoding:NSUTF8StringEncoding], 0, 16);
        return [CLUITool cl_colorWithHex:colorLong];
    }else{
        return nil;
    }
}

+ (UIImage *)cl_imageName:(NSString *)imageName{
    if ([CLStringTool cl_stringIsNull:imageName]) {
        return nil;
    }
    return [UIImage imageNamed:imageName];
}

+ (UIImage *)cl_fixOretationImage:(UIImage *)image{
    if (!image) {
        return nil;
    }
    
    // 正确的方向
    if (image.imageOrientation == UIImageOrientationUp){
        
        CGSize scaleSize = image.size;
        
        UIGraphicsBeginImageContext(scaleSize);
        
        // 绘制改变大小的图片
        [image drawInRect:CGRectMake(0, 0, scaleSize.width, scaleSize.height)];
        
        UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return scaledImage;
    }
    
    // 错误的方向
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (image.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, image.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, image.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (image.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    CGContextRef ctx = CGBitmapContextCreate(NULL, image.size.width, image.size.height,
                                             CGImageGetBitsPerComponent(image.CGImage), 0,
                                             CGImageGetColorSpace(image.CGImage),
                                             CGImageGetBitmapInfo(image.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (image.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.height,image.size.width), image.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.width,image.size.height), image.CGImage);
            break;
    }
    
    // 创建一张新图
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    
    return img;
}

+ (UIImage *)cl_partImage:(UIImage *)image rect:(CGRect)rect{
    if ([CLSystemTool cl_isNullObject:image]) {
        return nil;
    }
    CGImageRef imager = CGImageCreateWithImageInRect(image.CGImage,rect);
    UIImage *partImage = [UIImage imageWithCGImage:imager];
    CGImageRelease(imager);
    return partImage;
}


@end

