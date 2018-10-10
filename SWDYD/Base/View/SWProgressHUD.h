//
//  SWProgressHUD.h
//  SWDYD
//
//  Created by zijin on 2018/10/10.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "MBProgressHUD.h"

@interface SWProgressHUD : MBProgressHUD

/**
 纯文本提示，延时消失

 @param tip 提示语
 */
+ (void)sw_showTip:(NSString *)tip;

/**
 加载提示，无提示语，自定义显示层

 @param view 显示层 若nil，则显示window层
 */
+ (void)sw_showLoadingOnView:(UIView *)view;

/**
 加载提示，无提示语，自定义显示层

 @param message 提示语
 @param view 显示层 若nil，则显示window层
 */
+ (void)sw_showLoading:(NSString *)message onView:(UIView *)view;

/**
 隐藏加载提示

 @param view 显示层 若nil，则显示window层
 */
+ (void)sw_hideForView:(UIView *)view;

@end
