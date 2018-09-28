//
//  SWClientManager.m
//  SWDYD
//
//  Created by zijin on 2018/9/28.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWClientManager.h"

@implementation SWClientManager

+ (instancetype)shareManager {
    static SWClientManager *_clientManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_clientManager) {
            _clientManager = [[SWClientManager alloc] init];
        }
    });
    return _clientManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
