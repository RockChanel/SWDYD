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

@implementation SWCookieModel
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self yy_modelEncodeWithCoder:aCoder];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [self yy_modelInitWithCoder:aDecoder];
}
@end
