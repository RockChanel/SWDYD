//
//  SWClientManager.h
//  SWDYD
//
//  Created by zijin on 2018/9/28.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWClientManager : NSObject

@property (nonatomic, assign) BOOL isAutoLogin;

+ (instancetype)shareManager;

@end
