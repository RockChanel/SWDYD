//
//  SWClient.m
//  SWDYD
//
//  Created by zijin on 2018/9/30.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWClient.h"

@implementation SWClient

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
        self.isAutoLogin = YES;
    }
    return self;
}

@end
