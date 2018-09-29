//
//  SWFollowFooterView.h
//  SWDYD
//
//  Created by zijin on 2018/9/28.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSInteger const RecommandMaxCount = 3;
@interface SWFollowFooterView : UICollectionReusableView
/** 校验弹友或专区 yes:弹友 no:专区 */
@property (nonatomic, assign) BOOL isUser;
/** 刷新 */
@property (nonatomic, copy) void(^refreshCompletion)(NSArray * _Nullable models);
@end
