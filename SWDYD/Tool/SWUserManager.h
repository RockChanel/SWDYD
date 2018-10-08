//
//  SWUserManager.h
//  SWDYD
//
//  Created by zijin on 2018/9/30.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SWUserModel;
@interface SWUserManager : NSObject
/** 当前登录用户 */
@property (nonatomic, strong) SWUserModel *user;

+ (instancetype)shareManager;

@end


