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

#pragma mark -- 首页
//TODO: 关注
/** 关注列表 */
static NSString * const SWFollow_List = @"/v0.2/user/timeline";
/** 关注推荐 */
static NSString * const SWFollow_Recommend = @"/v0.2/main/recommend";


#pragma mark -- 我
/** 我的勋章 */
static NSString * const SWMe_MedalList = @"v0.3/user/medal/medal_list";
