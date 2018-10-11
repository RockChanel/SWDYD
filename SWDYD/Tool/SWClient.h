//
//  SWClient.h
//  SWDYD
//
//  Created by zijin on 2018/9/30.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SWEmoticonGroup;
@interface SWClient : NSObject
/** 是否自动登录 */
@property (nonatomic, assign) BOOL isAutoLogin;

/** 表情集合 防止频繁读取，临时放入客户端单例 */
@property (nonatomic, strong) SWEmoticonGroup *emoticonGroup;

+ (instancetype)shareClient;

/**
 登录事件

 @param phone 账号
 @param password 密码
 */
- (void)sw_loginWithPhone:(NSString *)phone password:(NSString *)password;

/**
 退出登录
 */
- (void)sw_logout;

@end
