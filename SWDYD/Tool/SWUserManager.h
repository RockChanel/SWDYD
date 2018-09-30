//
//  SWUserManager.h
//  SWDYD
//
//  Created by zijin on 2018/9/30.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const SWUserIdKey = @"SWUserIdKey";

@interface SWUserModel: NSObject
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *nickName;
@end

@interface SWUserManager : NSObject

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *nickName;

+ (instancetype)shareManager;

@end


