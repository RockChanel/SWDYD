//
//  SWSettingModel.h
//  SWDYD
//
//  Created by zijin on 2018/10/9.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

/** TAG -- 个人资料 */
static NSInteger const SWSettingProfileTag = 100;
/** TAG -- 黑名单 */
static NSInteger const SWSettingBlackListTag = 101;
/** TAG -- 夜间模式 */
static NSInteger const SWSettingNightModeTag = 102;
/** TAG -- WiFi下自动播放视频 */
static NSInteger const SWSettingAutoPlayTag = 103;
/** TAG -- 清除缓存 */
static NSInteger const SWSettingClearCacheTag = 104;

/** TAG -- 自动回复 */
static NSInteger const SWSettingAutoReplyTag = 200;
/** TAG -- 私信弹弹娘 */
static NSInteger const SWSettingMailMTag = 201;
/** TAG -- 私信弹弹妹 */
static NSInteger const SWSettingMailSTag = 203;

/** TAG -- 版本号 */
static NSInteger const SWSettingVersionTag = 300;
/** TAG -- 用户公约 */
static NSInteger const SWSettingConventionTag = 301;
/** TAG -- 免责声明 */
static NSInteger const SWSettingDisclaimerTag = 302;
/** TAG -- 商务合作 */
static NSInteger const SWSettingBusinessTag = 303;


@interface SWSettingModel : NSObject
/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 详情 */
@property (nonatomic, copy) NSString *detail;
/** 是否打开 */
@property (nonatomic, assign) BOOL on;
/** 标识 */
@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, assign) BOOL showArrow;

+ (NSArray *)sw_meSettingList;

@end
