//
//  SWRecommandModel.m
//  SWDYD
//
//  Created by zijin on 2018/10/9.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWRecommandModel.h"

@implementation SWRecommandBanner
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSNumber *type = dic[@"promotionType"];
    if ([type isKindOfClass:[NSNumber class]]) _promotionType = [type integerValue];
    return YES;
}
@end

@implementation SWRecommandBannerList
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"promotionList": [SWRecommandBanner class],
             @"promotionBulletinList": [SWRecommandBanner class]};
}
@end

@implementation SWRecommandModel

@end
