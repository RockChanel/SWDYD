//
//  SWTimeLineCell.h
//  SWDYD
//
//  Created by zijin on 2018/10/10.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWTableViewCell.h"

@class SWTimeLineLayout, SWTimeLineCell;

@protocol SWTimeLineCellDelegate <NSObject>
@optional
- (void)cellDidClickCollect:(SWTimeLineCell *)cell;
- (void)cellDidClickLike:(SWTimeLineCell *)cell;
@end

@interface SWTimeLineCell : SWTableViewCell
@property (nonatomic, strong) SWTimeLineLayout *layout;
@property (nonatomic, assign) id<SWTimeLineCellDelegate> delegate;
@end
