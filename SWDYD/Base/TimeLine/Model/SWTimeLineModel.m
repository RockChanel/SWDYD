//
//  SWTimeLineModel.m
//  SWDYD
//
//  Created by zijin on 2018/10/10.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWTimeLineModel.h"
#import "SWMedalModel.h"

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
