//
//  SWNetWorkApi.h
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

/** BaseURL */
static NSString * const SWBaseURL = @"https://api.diyidan.net";
/** BaseImageURL */
static NSString * const SWImageBaseURL = @"https://image.diyidan.net";

static NSString * const SWAppChannel = @"ios";
static NSString * const SWIsUpgrade = @"true";
static NSString * const SWVersionName = @"20180921";

#pragma mark -- 首页
/** 关注列表 */
static NSString * const SWAPI_FollowList = @"/v0.2/user/timeline";
/** 关注推荐 */
static NSString * const SWAPI_FollowRecommend = @"/v0.2/main/recommend";
/** 推荐 banner */
static NSString * const SWAPI_RecommandBanner = @"v0.2/promotion/index";

#pragma mark -- 版区
/** 热区 */
static NSString * const SWAPI_CommunityHotZone = @"v0.2/area";
static NSString * const SWAPI_HotZoneHead = @"v0.2/area/head";

#pragma mark -- 我
/** 主页 */
static NSString * const SWAPI_PersonalActivities = @"v0.2/personals/activities2";

/** 我的勋章 */
static NSString * const SWAPI_MyMedalList = @"v0.3/user/medal/medal_list";

#pragma mark -- 登录
static NSString * const SWAPI_Login = @"v0.2/users/login";
