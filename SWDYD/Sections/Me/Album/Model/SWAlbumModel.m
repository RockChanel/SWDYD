//
//  SWAlbumModel.m
//  SWDYD
//
//  Created by zijin on 2018/10/25.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWAlbumModel.h"

@implementation SWAlbumModel

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self yy_modelEncodeWithCoder:aCoder];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [self yy_modelInitWithCoder:aDecoder];
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSNumber *isAlbumdefault = dic[@"postAlbumIsDefault"];
    if ([isAlbumdefault isKindOfClass:[NSNumber class]]) _isDefault = [isAlbumdefault boolValue];
    NSNumber *albumShowDotHint = dic[@"postAlbumShowDotHint"];
    if ([albumShowDotHint isKindOfClass:[NSNumber class]]) _showDotHint = [albumShowDotHint boolValue];
    NSNumber *albumCanDelete = dic[@"postAlbumCanDelete"];
    if ([albumCanDelete isKindOfClass:[NSNumber class]]) _canDelete = [albumCanDelete boolValue];
    NSNumber *albumVisibilityCode = dic[@"postAlbumVisibilityCode"];
    if ([albumVisibilityCode isKindOfClass:[NSNumber class]]) _visibilityCode = [albumVisibilityCode integerValue];
    return YES;
}

+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"visibilityText": @"postAlbumVisibilityText",
             @"albumPhoto": @"postAlbumPhoto",
             @"albumName": @"postAlbumName",
             @"collectionCount": @"postAlbumCollectionCount",
             @"albumId": @"postAlbumId"};
}
@end

@implementation SWAlbumListModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"userPostAlbumList": [SWAlbumModel class]};
}
@end
