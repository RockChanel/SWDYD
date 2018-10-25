//
//  SWTimeLineCell.h
//  SWDYD
//
//  Created by zijin on 2018/10/10.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWTableViewCell.h"

@class SWTimeLineLayout, SWTimeLineCell;

/** cell代理事件 */
@protocol SWTimeLineCellDelegate <NSObject>
@optional
/** 点击收藏 */
- (void)cellDidClickCollect:(SWTimeLineCell *)cell;
/** 点击送糖 */
- (void)cellDidClickLike:(SWTimeLineCell *)cell;
/** 点击评论 */
- (void)cellDidClickComment:(SWTimeLineCell *)cell;
@end

@interface SWTimeLineCell : SWTableViewCell
@property (nonatomic, strong) SWTimeLineLayout *layout;
@property (nonatomic, assign) id<SWTimeLineCellDelegate> delegate;
@end
