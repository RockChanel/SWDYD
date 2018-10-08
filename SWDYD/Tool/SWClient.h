//
//  SWClient.h
//  SWDYD
//
//  Created by zijin on 2018/9/30.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWClient : NSObject
/** 是否自动登录 */
@property (nonatomic, assign) BOOL isAutoLogin;

+ (instancetype)shareClient;

/**
 登录事件

 @param phone 账号
 @param password 密码
 */
- (void)sw_loginWithPhone:(NSString *)phone password:(NSString *)password;

@end
