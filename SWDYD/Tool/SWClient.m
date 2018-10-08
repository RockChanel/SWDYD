//
//  SWClient.m
//  SWDYD
//
//  Created by zijin on 2018/9/30.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWClient.h"

@implementation SWClient
@synthesize isAutoLogin = _isAutoLogin;

static NSString * const SWLocalIsAutoLoginKey = @"SWLocalIsAutoLoginKey";

+ (instancetype)shareClient {
    static SWClient *_client = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_client) {
            _client = [[SWClient alloc] init];
        }
    });
    return _client;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)sw_loginWithPhone:(NSString *)phone password:(NSString *)password {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"account"] = phone;
    params[@"password"] = password;
    params[@"appChannel"] = SWAppChannel;
    params[@"isUpgrade"] = SWIsUpgrade;
    params[@"versionName"] = SWVersionName;
    
    [[SWNetworkManager shareManager] requestWithMethod:SWHttpMethodPost api:SWAPI_Login parameters:params success:^(SWJsonModel * _Nullable json) {
        NSArray *userList = json.data[@"userList"];
        if ([userList isKindOfClass:[NSArray class]] && userList.count > 0) {
            SWUserModel *user = [SWUserModel yy_modelWithJSON:userList[0]];
            [[SWUserManager shareManager] setUser:user];
            [[SWClient shareClient] setIsAutoLogin:YES];
            [[NSNotificationCenter defaultCenter] postNotificationName:SWNotification_LoginStateChange object:[NSNumber numberWithBool:YES]];
        }
    } failure:nil];
}

#pragma mark -- getter & setter
/** 存储自动登录状态 */
- (void)setIsAutoLogin:(BOOL)isAutoLogin {
    _isAutoLogin = isAutoLogin;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:YES forKey:SWLocalIsAutoLoginKey];
    [userDefaults synchronize];
}
/** 读取自动登录状态 */
- (BOOL)isAutoLogin {
    return [[NSUserDefaults standardUserDefaults] boolForKey:SWLocalIsAutoLoginKey];
}

@end
