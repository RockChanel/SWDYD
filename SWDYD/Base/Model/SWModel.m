//
//  SWModel.m
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWModel.h"

@implementation SWJsonModel

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSNumber *statusCode = dic[@"code"];
    if ([statusCode isKindOfClass:[NSNumber class]]) _code = [statusCode integerValue];
    return YES;
}

@end
