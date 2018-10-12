//
//  SWTimeLineModel.m
//  SWDYD
//
//  Created by zijin on 2018/10/10.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWTimeLineModel.h"
#import "SWMedalModel.h"

@implementation SWTimeLineMusic
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSNumber *duration = dic[@"musicDuration"];
    if ([duration isKindOfClass:[NSNumber class]]) _musicDuration = [duration integerValue];
    NSNumber *size = dic[@"musicSize"];
    if ([size isKindOfClass:[NSNumber class]]) _musicSize = [size integerValue];
    NSNumber *canDownload = dic[@"musicCanDownload"];
    if ([canDownload isKindOfClass:[NSNumber class]]) _musicCanDownload = [canDownload boolValue];
    return YES;
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"musicSingers": [NSString class]};
}
@end

@implementation SWTimeLineVideo

@end

@implementation SWTimeLineAuthor
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"woreList": [SWMedal class]};
}
@end

@implementation SWTimeLineItem
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSNumber *collectCount = dic[@"postCollectCount"];
    if ([collectCount isKindOfClass:[NSNumber class]]) _postCollectCount = [collectCount integerValue];
    NSNumber *shareCount = dic[@"postShareCount"];
    if ([shareCount isKindOfClass:[NSNumber class]]) _postShareCount = [shareCount integerValue];
    NSNumber *commentCount = dic[@"postCommentCount"];
    if ([commentCount isKindOfClass:[NSNumber class]]) _postCommentCount = [commentCount integerValue];
    NSNumber *likeCount = dic[@"postLikeCount"];
    if ([likeCount isKindOfClass:[NSNumber class]]) _postLikeCount = [likeCount integerValue];
    return YES;
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"postCoverImageList": [NSString class]};
}
@end

@implementation SWTimeLineModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"postList": [SWTimeLineItem class]};
}
@end

@implementation SWEmoticon

@end

@implementation SWEmoticonGroup
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"emoticons": [SWEmoticon class]};
}
@end
