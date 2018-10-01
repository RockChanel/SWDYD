//
//  SWHotZoneModel.m
//  SWDYD
//
//  Created by selwyn on 2018/10/1.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWHotZoneModel.h"

@implementation SWHotCategoryInfo

+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"areaName": @"subAreaName",
             @"headImage": @"subAreaHeadImage"};
}
@end

@implementation SWHotCategoryInfoList

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list": [SWHotCategoryInfo class]};
}

+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"list": @"secondLevelCategorySubareaList",
             @"category": @"secondLevelCategoryName"};
}
@end

@implementation SWHotZoneModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"categoryInfoList": [SWHotCategoryInfoList class]};
}

+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"categoryInfoList": @"subareaSelectedFirstLevelCategoryInfoList",
             @"categoryList": @"subareaAllFirstLevelCategoryList",
             @"category": @"subareaSelectedFirstLevelCategory"};
}

@end
