//
//  UIImage+Ext.m
//  SWDYD
//
//  Created by zijin on 2018/10/24.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "UIImage+Ext.h"

@implementation UIImage (Ext)

- (UIImage *)imageByResizeToSize:(CGSize)size {
    if (size.width <= 0 || size.height <= 0) return nil;
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
