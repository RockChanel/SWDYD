//
//  SWFollowModel.h
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SWFollowArea: NSObject
/** 贴子数 */
@property (nonatomic, strong) NSNumber *subAreaPostCount;
/** 专区名 */
@property (nonatomic, copy) NSString *subAreaName;
@end

@interface SWFollowUser: NSObject
/** 昵称 */
@property (nonatomic, copy) NSString *nickName;
/** 标签 */
@property (nonatomic, copy) NSString *userRecommendStmt;
/** 头像 */
@property (nonatomic, copy) NSString *avatar;
@end

@interface SWFollowModel : NSObject
@property (nonatomic, strong) NSArray<SWFollowArea *> *recommendSubAreaList;
@property (nonatomic, strong) NSArray<SWFollowUser *> *recommendPageUserList;
@end

