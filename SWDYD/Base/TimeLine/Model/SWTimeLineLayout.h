//
//  SWTimeLineLayout.h
//  SWDYD
//
//  Created by zijin on 2018/10/11.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 风格
typedef NS_ENUM(NSInteger, SWLayoutStyle) {
    SWLayoutStyleTimeline = 0, ///< 时间线
    SwLayoutStyleDetail,       ///< 详情页
};

@class SWTimeLineItem;
@interface SWTimeLineLayout : NSObject

@property (nonatomic, strong) SWTimeLineItem *item;
@property (nonatomic, assign) SWLayoutStyle style;



- (instancetype)initWithItem:(SWTimeLineItem *)item style:(SWLayoutStyle)style;

@end
