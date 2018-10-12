//
//  SWTimeLineModel.h
//  SWDYD
//
//  Created by zijin on 2018/10/10.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SWMedal;

@interface SWTimeLineMusic : NSObject
@property (nonatomic, strong) NSArray<NSString *> *musicSingers;
@property (nonatomic, copy) NSString *musicName;
@property (nonatomic, copy) NSString *musicUrl;
@property (nonatomic, copy) NSString *musicImageUrl;
@property (nonatomic, assign) NSInteger musicDuration;
@property (nonatomic, assign) NSInteger musicSize;
@property (nonatomic, copy) NSString *musicType;
@property (nonatomic, assign) BOOL musicCanDownload;
@end

@interface SWTimeLineVideo : NSObject
@property (nonatomic, copy) NSString *videoPlayUrl;
@end

@interface SWTimeLineAuthor : SWUserModel
@property (nonatomic, strong) NSArray<SWMedal *> *woreList;
@end

@interface SWTimeLineItem : NSObject
/** 发布内容 */
@property (nonatomic, copy) NSString *postContent;
/** 收藏数 */
@property (nonatomic, assign) NSInteger postCollectCount;
/** 分享数 */
@property (nonatomic, assign) NSInteger postShareCount;
/** 评论数 */
@property (nonatomic, assign) NSInteger postCommentCount;
/** 喜欢数 */
@property (nonatomic, assign) NSInteger postLikeCount;
/** 发布标题 */
@property (nonatomic, copy) NSString *postTitle;
/** 发布者 */
@property (nonatomic, strong) SWTimeLineAuthor *postAuthor;
/** 更新时间 */
@property (nonatomic, copy) NSString *postLatestUpdateTime;
/** 图片数组 */
@property (nonatomic, strong) NSArray<NSString *> *postCoverImageList;
/** 视频 */
@property (nonatomic, strong) SWTimeLineVideo *postVideo;
/** 音乐 */
@property (nonatomic, strong) SWTimeLineMusic *postMusic;
@end

@interface SWTimeLineModel : NSObject
@property (nonatomic, strong) NSArray<SWTimeLineItem *> *postList;
@end

@interface SWEmoticon : NSObject
@property (nonatomic, copy) NSString *chs;  ///< 例如 [吃惊]
@property (nonatomic, copy) NSString *cht;  ///< 例如 [吃驚]
@property (nonatomic, copy) NSString *gif;  ///< 例如 d_chijing.gif
@property (nonatomic, copy) NSString *png;  ///< 例如 d_chijing.png
@property (nonatomic, copy) NSString *type;
@end


@interface SWEmoticonGroup : NSObject
@property (nonatomic, strong) NSArray<SWEmoticon *> *emoticons;
@end
