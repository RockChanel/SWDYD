//
//  UIColor+ThemeColor.m
//  SWDYD
//
//  Created by zijin on 2018/9/26.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "UIColor+ThemeColor.h"

@implementation UIColor (ThemeColor)

+ (UIColor *)sw_red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [UIColor sw_red:red green:green blue:blue alpha:1.0];
}

+ (UIColor *)sw_red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

+ (UIColor *)sw_red {
    return [UIColor sw_red:251 green:86 blue:149];
}

@end
