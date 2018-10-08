//
//  SWUserModel.h
//  SWDYD
//
//  Created by zijin on 2018/10/8.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWUserModel : NSObject <NSCoding>
/** 头像 */
@property (nonatomic, copy) NSString *avatar;
/** 昵称 */
@property (nonatomic, copy) NSString *nickName;
/** 用户id */
@property (nonatomic, copy) NSString *userId;
/** 用户账号 */
@property (nonatomic, copy) NSString *userAccount;
/** 学校名称 */
@property (nonatomic, copy) NSString *userSchoolName;
/** 手机号 */
@property (nonatomic, copy) NSString *userPhone;
/** 经验 */
@property (nonatomic, assign) NSInteger userExp;
/** 粉丝数 */
@property (nonatomic, assign) NSInteger userFollowerCount;
/** 用户等级 */
@property (nonatomic, assign) NSInteger userLevel;
/** 用户性别 */
@property (nonatomic, copy) NSString *gender;
@end
