//
//  SWUserManager.m
//  SWDYD
//
//  Created by zijin on 2018/9/30.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWUserManager.h"

@implementation SWUserModel

@end

@implementation SWUserManager

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

@end
