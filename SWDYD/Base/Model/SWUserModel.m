//
//  SWUserModel.m
//  SWDYD
//
//  Created by zijin on 2018/10/8.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWUserModel.h"

@implementation SWUserModel

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self yy_modelEncodeWithCoder:aCoder];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [self yy_modelInitWithCoder:aDecoder];
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSNumber *tempUserExp = dic[@"userExp"];
    if ([tempUserExp isKindOfClass:[NSNumber class]]) _userExp = [tempUserExp integerValue];
    NSNumber *tempUserFollowerCount = dic[@"userFollowerCount"];
    if ([tempUserFollowerCount isKindOfClass:[NSNumber class]]) _userFollowerCount = [tempUserFollowerCount integerValue];
    NSNumber *tempUserLevel = dic[@"userLevel"];
    if ([tempUserLevel isKindOfClass:[NSNumber class]]) _userLevel = [tempUserLevel integerValue];
    return YES;
}

@end
