//
//  SWClient.h
//  SWDYD
//
//  Created by zijin on 2018/9/30.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWClient : NSObject

@property (nonatomic, assign) BOOL isAutoLogin;

+ (instancetype)shareClient;

@end