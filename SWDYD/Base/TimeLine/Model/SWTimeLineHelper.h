//
//  SWTimeLineHelper.h
//  SWDYD
//
//  Created by zijin on 2018/10/11.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SWEmoticonGroup, SWEmoticon;
@interface SWTimeLineHelper : NSObject

/** 表情正则 */
+ (NSRegularExpression *)regexEmoticon;

/**
 匹配表情

 @param emoticonStr 表情文本
 */
+ (SWEmoticon *)emoticon:(NSString *)emoticonStr;

/**
 UTC时区时间转换系统时间

 @param dateStr UTC时区时间
 @return 系统时间
 */
+ (NSDate *)date:(NSString *)dateStr;

/** 时间转换显示 */
+ (NSString *)shortDateDesc:(NSDate *)date;

+ (NSString *)shortedNumberDesc:(NSInteger)number;

@end
