//
//  SWVideoListModel.m
//  SWDYD
//
//  Created by zijin on 2018/10/22.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWVideoListModel.h"

@implementation SWVideo
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSNumber *readCount = dic[@"postReadCount"];
    if ([readCount isKindOfClass:[NSNumber class]]) _postReadCount = [readCount integerValue];
    return YES;
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"postCoverImageList": [NSString class]};
}
@end

@implementation SWVideoListModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"shortVideoPostList": [SWVideo class]};
}
@end
