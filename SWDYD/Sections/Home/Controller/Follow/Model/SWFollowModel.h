//
//  SWFollowModel.h
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 推荐专区
 */
@interface SWFollowArea: NSObject
/** 贴子数 */
@property (nonatomic, strong) NSNumber *subAreaPostCount;
/** 专区名 */
@property (nonatomic, copy) NSString *subAreaName;
/** 专区展示图 */
@property (nonatomic, copy) NSString *subAreaHeadImage;
@end

/**
 推荐用户
 */
@interface SWFollowUser: NSObject
/** 昵称 */
@property (nonatomic, copy) NSString *nickName;
/** 标签 */
@property (nonatomic, copy) NSString *userRecommendStmt;
/** 头像 */
@property (nonatomic, copy) NSString *avatar;
/** 用户id */
@property (nonatomic, copy) NSString *userId;
/** 用户等级 */
@property (nonatomic, strong) NSNumber *userLevel;
@end

/**
 推荐关注列表
 */
@interface SWFollowModel : NSObject
@property (nonatomic, strong) NSArray *recommendSubAreaList;
@property (nonatomic, strong) NSArray *recommendPageUserList;
@end

