//
//  SWAlbumModel.h
//  SWDYD
//
//  Created by zijin on 2018/10/25.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWAlbumModel : NSObject <NSCoding>
@property (nonatomic, copy) NSString *visibilityText;
@property (nonatomic, copy) NSString *albumPhoto;
@property (nonatomic, assign) BOOL isDefault;
@property (nonatomic, assign) BOOL showDotHint;
@property (nonatomic, assign) BOOL canDelete;
@property (nonatomic, copy) NSString *albumName;
@property (nonatomic, copy) NSString *collectionCount;
@property (nonatomic, assign) NSInteger visibilityCode;
@property (nonatomic, copy) NSString *albumId;
@end

@interface SWAlbumListModel : NSObject
@property (nonatomic, strong) NSArray<SWAlbumModel *> *userPostAlbumList;
@end
