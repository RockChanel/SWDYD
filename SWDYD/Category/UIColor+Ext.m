//
//  UIColor+Ext.m
//  SWDYD
//
//  Created by zijin on 2018/10/8.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "UIColor+Ext.h"

@implementation UIColor (Ext)

+ (UIColor *)sw_red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [UIColor sw_red:red green:green blue:blue alpha:1.0];
}

+ (UIColor *)sw_red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

+ (UIColor *)sw_red {
    return [UIColor sw_red:251 green:86 blue:149];
}

+ (UIColor *)sw_gray {
    return [UIColor sw_red:153 green:153 blue:153];
}

+ (UIColor *)sw_darkGray {
    return [UIColor sw_red:102 green:102 blue:102];
}

+ (UIColor *)sw_black {
    return [UIColor sw_red:51 green:51 blue:51];
}

+ (UIColor *)sw_tableBg {
    return [UIColor sw_red:239 green:243 blue:248];
}

@end
