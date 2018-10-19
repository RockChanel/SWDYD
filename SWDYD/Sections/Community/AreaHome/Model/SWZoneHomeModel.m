//
//  SWZoneHomeModel.m
//  SWDYD
//
//  Created by zijin on 2018/10/9.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWZoneHomeModel.h"

@implementation SWZoneHomeCategory

@end

@implementation SWZoneHomeHeaderModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"subAreaPostCategories": [NSString class],
             @"subAreaPostCateId": [NSString class],
             @"subAreaCategoryInfoList": [SWZoneHomeCategory class]};
}
@end

@implementation SWZoneHomeModel

@end
