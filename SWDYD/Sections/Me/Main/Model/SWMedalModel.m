//
//  SWMedalModel.m
//  SWDYD
//
//  Created by zijin on 2018/9/30.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWMedalModel.h"

@implementation SWMedal

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSNumber *have = dic[@"isHave"];
    NSNumber *new = dic[@"isNew"];
    NSNumber *show = dic[@"isShow"];
    NSNumber *wore = dic[@"isWore"];
    if ([have isKindOfClass:[NSNumber class]]) _isHave = [have boolValue];
    if ([new isKindOfClass:[NSNumber class]]) _isNew = [new boolValue];
    if ([show isKindOfClass:[NSNumber class]]) _isShow = [show boolValue];
    if ([wore isKindOfClass:[NSNumber class]]) _isWore = [wore boolValue];
    return YES;
}

@end

@implementation SWMedalUser
@end

@implementation SWMedalTypeList

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"medalList": [SWMedal class]};
}

@end

@implementation SWMedalList

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSNumber *count = dic[@"userMedalCount"];
    if ([count isKindOfClass:[NSNumber class]]) _medalCount = [count integerValue];
    return YES;
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"allMedalList": [SWMedalTypeList class]};
}

+ (SWMedalList *)getShowMedalsWithList:(SWMedalList *)list {
    if (!list.allMedalList) return list;
    NSMutableArray *result = [NSMutableArray array];
    for (int i = 0; i < list.allMedalList.count; i++) {
        SWMedalTypeList *typeList = list.allMedalList[i];
        NSMutableArray *tempMedals = [NSMutableArray array];
        for (int j = 0; j < typeList.medalList.count; j ++) {
            SWMedal *medal = typeList.medalList[j];
            if (medal.isShow) {
                [tempMedals addObject:medal];
            }
        }
        typeList.medalList = tempMedals;
        [result addObject:typeList];
    }
    list.allMedalList = result;
    return list;
}

@end
