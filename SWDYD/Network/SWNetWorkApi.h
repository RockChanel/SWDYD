//
//  SWNetWorkApi.h
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

/** BaseURL */
static NSString * const kSWBaseURL = @"https://api.diyidan.net";
/** BaseImageURL */
static NSString * const kSWImageBaseURL = @"https://image.diyidan.net";

static NSString * const kSWAppChannel = @"ios";
static NSString * const kSWIsUpgrade = @"true";
static NSString * const kSWVersionName = @"20180921";
static NSString * const kSWTokenKey = @"token_id";
static NSString * const kSWSessionKey = @"session_id";

#pragma mark -- ResponseCode
static NSInteger const kSWResponseCodeSuccess = 200;

#pragma mark --
static NSString * const kSWApiKey = @"v0.2/upyun/key";

#pragma mark -- 首页
/** 关注列表 */
static NSString * const kSWApiFollowList = @"/v0.2/user/timeline";
/** 关注推荐 */
static NSString * const kSWApiFollowRecommend = @"/v0.2/main/recommend";
/** 推荐 banner */
static NSString * const kSWApiRecommandBanner = @"v0.2/promotion/index";
/** 推荐列表 */
static NSString * const kSWApiRecommandPostList = @"v0.2/posts4";
static NSString * const kSWApiShortvideoList = @"v0.2/posts/shortvideo";

#pragma mark -- 版区
/** 热区 */
static NSString * const kSWApiCommunityHotZone = @"v0.2/area";
static NSString * const kSWApiHotZoneHead = @"v0.2/area/head";
static NSString * const kSWApiHotZoneDetail = @"v0.2/area/detail_new";

#pragma mark -- 我
/** 主页 */
static NSString * const kSWApiPersonalActivities = @"v0.2/personals/activities2";

/** 我的勋章 */
static NSString * const kSWApiMyMedalList = @"v0.3/user/medal/medal_list";

#pragma mark -- 登录
static NSString * const kSWApiLogin = @"v0.2/users/login";

#pragma mark -- WebURL
/** 免责声明 */
static NSString * const kSWURLDisclaimer = @"https://app.diyidan.net/alert.html";
