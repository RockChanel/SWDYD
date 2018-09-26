//
//  UIColor+ThemeColor.h
//  SWDYD
//
//  Created by zijin on 2018/9/26.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ThemeColor)

/** 色值构建 */
+ (UIColor *)sw_red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+ (UIColor *)sw_red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/** 主题红色 */
+ (UIColor *)sw_red;

@end
