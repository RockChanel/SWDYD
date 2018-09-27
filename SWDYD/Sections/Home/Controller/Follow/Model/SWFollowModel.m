//
//  SWFollowModel.m
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWFollowModel.h"

@implementation SWFollowArea

@end

@implementation SWFollowUser

@end

@implementation SWFollowModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"recommendSubAreaList": [SWFollowArea class],
             @"recommendPageUserList": [SWFollowUser class]};
}
@end

