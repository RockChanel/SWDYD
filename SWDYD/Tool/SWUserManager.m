//
//  SWUserManager.m
//  SWDYD
//
//  Created by zijin on 2018/9/30.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWUserManager.h"

@implementation SWUserManager
@synthesize user = _user;

/** 用户本地信息 key */
static NSString * const SWLocalUserKey = @"SWLocalUserKey";

+ (instancetype)shareManager {
    static SWUserManager *_userManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_userManager) {
            _userManager = [[SWUserManager alloc] init];
        }
    });
    return _userManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

/** 保存用户信息 */
- (void)sw_saveUser:(SWUserModel *)user {
    NSData *encodeData = [NSKeyedArchiver archivedDataWithRootObject:user];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:encodeData forKey:SWLocalUserKey];
    [userDefaults synchronize];
}

/** 读取用户信息 */
- (SWUserModel *)sw_getUser {
    NSData *encodeObject = [[NSUserDefaults standardUserDefaults] objectForKey:SWLocalUserKey];
    SWUserModel *tempUser = [NSKeyedUnarchiver unarchiveObjectWithData:encodeObject];
    return tempUser;
}

#pragma mark -- getter & setter
/** 保存用户信息 */
- (void)setUser:(SWUserModel *)user {
    user.avatar = [NSString stringWithFormat:@"%@%@", kSWImageBaseURL, user.avatar];
    _user = user;
    [self sw_saveUser:_user];
}
/** 读取用户信息 */
- (SWUserModel *)user {
    return [self sw_getUser];
}

@end
