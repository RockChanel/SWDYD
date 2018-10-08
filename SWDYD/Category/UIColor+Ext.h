//
//  UIColor+Ext.h
//  SWDYD
//
//  Created by zijin on 2018/10/8.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Ext)

/** 色值构建 */
+ (UIColor *)sw_red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+ (UIColor *)sw_red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/** 红色 */
+ (UIColor *)sw_red;
/** 深灰色 */
+ (UIColor *)sw_darkGray;
/** 灰色 */
+ (UIColor *)sw_gray;
/** 黑色 */
+ (UIColor *)sw_black;
/** 表单背景色 */
+ (UIColor *)sw_tableBg;

@end
