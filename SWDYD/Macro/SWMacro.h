//
//  SWMacro.h
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//
/**
 基础配置文件
 */

#ifndef SWMacro_h
#define SWMacro_h

/** 屏幕宽度 */
#define SWScreenWidth [UIScreen mainScreen].bounds.size.width
/** 屏幕高度 */
#define SWScreenHeight [UIScreen mainScreen].bounds.size.height
/** 导航栏高度 */
#define SWNavigationBarHeight self.navigationController.navigationBar.frame.size.height
/** 状态栏高度 */
#define SWStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

#endif /* SWMacro_h */
