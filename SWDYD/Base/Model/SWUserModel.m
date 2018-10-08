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
    [aCoder encodeObject:_avatar forKey:@"avatar"];
    [aCoder encodeObject:_nickName forKey:@"nickName"];
    [aCoder encodeObject:_userId forKey:@"userId"];
    [aCoder encodeObject:_userAccount forKey:@"userAccount"];
    [aCoder encodeObject:_userSchoolName forKey:@"userSchoolName"];
    [aCoder encodeObject:_userPhone forKey:@"userPhone"];
    [aCoder encodeInteger:_userExp forKey:@"userExp"];
    [aCoder encodeInteger:_userFollowerCount forKey:@"userFollowerCount"];
    [aCoder encodeInteger:_userLevel forKey:@"userLevel"];
    [aCoder encodeObject:_gender forKey:@"gender"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _avatar = [aDecoder decodeObjectForKey:@"avatar"];
        _nickName = [aDecoder decodeObjectForKey:@"nickName"];
        _userId = [aDecoder decodeObjectForKey:@"userId"];
        _userAccount = [aDecoder decodeObjectForKey:@"userAccount"];
        _userSchoolName = [aDecoder decodeObjectForKey:@"userSchoolName"];
        _userPhone = [aDecoder decodeObjectForKey:@"userPhone"];
        _userExp = [aDecoder decodeIntegerForKey:@"userExp"];
        _userFollowerCount = [aDecoder decodeIntegerForKey:@"userFollowerCount"];
        _userLevel = [aDecoder decodeIntegerForKey:@"userLevel"];
        _gender = [aDecoder decodeObjectForKey:@"gender"];
    }
    return self;
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
