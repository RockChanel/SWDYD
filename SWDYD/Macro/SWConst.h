//
//  SWConst.h
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//
/**
 常量配置文件
 */

#import <Foundation/Foundation.h>

/** 用户缺省头像 */
static NSString * const kSWUserAvatar  = @"placeHolder_userAvatar";
/** 加载缺省图片 */
static NSString * const kSWLoadImage  = @"ic_picture_load";
static NSString * const kSWLoadeedImage = @"ic_picture_loadeed";

#pragma mark -- 布局
/** 导航栏背景 */
static NSString * const kSWNavBackground  = @"NavBackgroundImage_0x64_";
/** tabBar背景 */
static NSString * const kSWTabBackground  = @"Default_Skin_TabbarBackgroundImage_X_0x49_";
/** 返回按钮 红色 */
static NSString * const kSWBackItemRed = @"navi_bar_back_img_red_30x30_";
/** 返回按钮 白色 */
static NSString * const kSWBackItemWhite = @"nav_back_white_30x30_";


#pragma mark -- KeyPath & Notification
/** 偏移量 */
static NSString * const kSWKeyPathContentOffset = @"contentOffset";
/** 登录状态变更通知 */
static NSString * const kSWNotificationLoginStateChange = @"loginStateChange";
