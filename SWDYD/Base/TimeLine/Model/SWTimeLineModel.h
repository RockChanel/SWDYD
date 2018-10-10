//
//  SWTimeLineModel.h
//  SWDYD
//
//  Created by zijin on 2018/10/10.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWTimeLineItem : NSObject
/** 发布者等级 */
@property (nonatomic, assign) NSInteger postAuthorLevel;
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
/** 发布者昵称 */
@property (nonatomic, copy) NSString *postAuthorName;
/** 发布标题 */
@property (nonatomic, copy) NSString *postTitle;
@end

@interface SWTimeLineModel : NSObject
@property (nonatomic, strong) NSArray<SWTimeLineItem *> *postList;
@end
