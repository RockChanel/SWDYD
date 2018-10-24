//
//  SWClient.m
//  SWDYD
//
//  Created by zijin on 2018/9/30.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWClient.h"
#import "SWTimeLineModel.h"
#import "SWModel.h"

@implementation SWClient
@synthesize isAutoLogin = _isAutoLogin;
@synthesize token = _token;
@synthesize session = _session;

static NSString * const SWLocalIsAutoLoginKey = @"SWLocalIsAutoLoginKey";
static NSString * const SWLocalTokenKey = @"SWLocalTokenKey";
static NSString * const SWLocalSessionKey = @"SWLocalSessionKey";

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
        _emoticonGroup = [self sw_emoticonGroupFromPlist];
        _versionName = @"20180921";
        _albumId = @"14905495";
    }
    return self;
}

- (void)sw_loginWithPhone:(NSString *)phone password:(NSString *)password {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"account"] = phone;
    params[@"password"] = password;
    params[@"appChannel"] = kSWAppChannel;
    params[@"isUpgrade"] = kSWIsUpgrade;
    params[@"versionName"] = kSWVersionName;
    
    [[SWNetworkManager shareManager] requestWithMessage:@"正在登录" onView:nil method:SWHttpMethodPost api:kSWApiLogin parameters:params success:^(SWJsonModel * _Nullable json) {
        if (json.code == kSWResponseCodeSuccess) {
            NSArray<NSHTTPCookie *> *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", kSWBaseURL, kSWApiLogin]]];
            [self saveCookies:cookies];
            
            NSArray *userList = json.data[@"userList"];
            if ([userList isKindOfClass:[NSArray class]] && userList.count > 0) {
                SWUserModel *user = [SWUserModel yy_modelWithJSON:userList[0]];
                [[SWUserManager shareManager] setUser:user];
                [[SWClient shareClient] setIsAutoLogin:YES];
                [[NSNotificationCenter defaultCenter] postNotificationName:kSWNotificationLoginStateChange object:[NSNumber numberWithBool:YES]];
            }
        }
    } failure:nil];
}

- (void)sw_logout {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"xiaomiId"] = @"";

    [[SWNetworkManager shareManager] requestWithMessage:@"" onView:nil method:SWHttpMethodDelete api:kSWApiLogin parameters:params success:^(SWJsonModel * _Nullable json) {
        if (json.code == kSWResponseCodeSuccess) {
            [[SWUserManager shareManager] setUser:nil];
            self.isAutoLogin = NO;
            [self clearCookies];
            [[NSNotificationCenter defaultCenter] postNotificationName:kSWNotificationLoginStateChange object:[NSNumber numberWithBool:NO]];
        }
    } failure:nil];
}

- (void)saveCookies:(NSArray<NSHTTPCookie *> *)cookies {
    if (!cookies || cookies.count == 0) return;
    for (NSHTTPCookie *cookie in cookies) {
        SWCookieModel *token = [[SWCookieModel alloc]init];
        token.name = cookie.name;
        token.value = cookie.value;
        if ([cookie.name isEqualToString:kSWTokenKey]) {
            self.token = token;
        }
        else if ([cookie.name isEqualToString:kSWSessionKey]) {
            self.session = token;
        }
    }
}

- (void)clearCookies {
    self.token = nil;
    self.session = nil;
}

#pragma mark -- getter & setter
/** 存储自动登录状态 */
- (void)setIsAutoLogin:(BOOL)isAutoLogin {
    _isAutoLogin = isAutoLogin;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:_isAutoLogin forKey:SWLocalIsAutoLoginKey];
    [userDefaults synchronize];
}
/** 读取自动登录状态 */
- (BOOL)isAutoLogin {
    return [[NSUserDefaults standardUserDefaults] boolForKey:SWLocalIsAutoLoginKey];
}

- (void)setToken:(SWCookieModel *)token {
    _token = token;
    NSData *encodeData = [NSKeyedArchiver archivedDataWithRootObject:token];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:encodeData forKey:SWLocalTokenKey];
    [userDefaults synchronize];
}

- (SWCookieModel *)token {
    NSData *encodeObject = [[NSUserDefaults standardUserDefaults] objectForKey:SWLocalTokenKey];
    SWCookieModel *tempToken = [NSKeyedUnarchiver unarchiveObjectWithData:encodeObject];
    return tempToken;
}

- (void)setSession:(SWCookieModel *)session {
    _session = session;
    NSData *encodeData = [NSKeyedArchiver archivedDataWithRootObject:session];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:encodeData forKey:SWLocalSessionKey];
    [userDefaults synchronize];
}

- (SWCookieModel *)session {
    NSData *encodeObject = [[NSUserDefaults standardUserDefaults] objectForKey:SWLocalSessionKey];
    SWCookieModel *tempSession = [NSKeyedUnarchiver unarchiveObjectWithData:encodeObject];
    return tempSession;
}

/** 读取表情 */
- (SWEmoticonGroup *)sw_emoticonGroupFromPlist {
    NSString *emoticonPath = [[NSBundle mainBundle] pathForResource:@"emotionDefault" ofType:@"plist"];
    NSArray *emoticonList = [NSArray arrayWithContentsOfFile:emoticonPath];
    SWEmoticonGroup *group = [SWEmoticonGroup yy_modelWithDictionary:@{@"emoticons":emoticonList}];
    return group;
}

@end
