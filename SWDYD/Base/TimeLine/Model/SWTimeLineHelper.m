//
//  SWTimeLineHelper.m
//  SWDYD
//
//  Created by zijin on 2018/10/11.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWTimeLineHelper.h"
#import "SWTimeLineModel.h"
#import "NSDate+Ext.h"

@implementation SWTimeLineHelper

+ (NSRegularExpression *)regexEmoticon {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\[[^ \\[\\]]+?\\]" options:kNilOptions error:NULL];
    return regex;
}

+ (SWEmoticon *)emoticon:(NSString *)emoticonStr {
    SWEmoticonGroup *group = [SWClient shareClient].emoticonGroup;
    SWEmoticon *tempEmo = nil;
    for (SWEmoticon *emo in group.emoticons) {
        if ([emo.chs isEqualToString:emoticonStr] || [emo.cht isEqualToString:emoticonStr]) {
            tempEmo = emo;
            break;
        }
    }
    return tempEmo;
}

+ (NSDate *)date:(NSString *)dateStr {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    return [dateFormatter dateFromString:dateStr];
}

+ (NSString *)shortDateDesc:(NSDate *)date {
    if (!date) return @"";
    
    NSDateFormatter *formatterFullDate = [[NSDateFormatter alloc] init];
    [formatterFullDate setDateFormat:@"yy-MM-dd HH:mm"];
    [formatterFullDate setLocale:[NSLocale currentLocale]];
    
    NSDate *now = [NSDate date];
    NSTimeInterval delta = now.timeIntervalSince1970 - date.timeIntervalSince1970;
    if (delta < -60 * 10) { // 本地时间有问题
        return [formatterFullDate stringFromDate:date];
    } else if (delta < 60 * 3) { // 3分钟内
        return @"刚刚";
    } else if (delta < 60 * 60) { // 1小时内
        return [NSString stringWithFormat:@"%d分钟前", (int)(delta / 60.0)];
    } else if (date.isToday || date.isYesterday) {
        return [NSString stringWithFormat:@"%d小时前", (int)(delta / 60.0 / 60.0)];
    } else if (delta < 60 * 60 * 24 * 20) { // 20天内
        return [NSString stringWithFormat:@"%d天前", (int)(delta / 60.0 / 60.0 / 24)];
    }else {
        return [formatterFullDate stringFromDate:date];
    }
}

+ (NSString *)shortedNumberDesc:(NSInteger)number {
    if (number <= 9999) return [NSString stringWithFormat:@"%d", (int)number];
    if (number <= 9999999) return [NSString stringWithFormat:@"%d万", (int)(number / 10000)];
    return [NSString stringWithFormat:@"%d千万", (int)(number / 10000000)];
}

+ (NSMutableAttributedString *)text:(NSString *)text
                           fontSize:(CGFloat)fontSize
                          textColor:(UIColor *)textColor {
    NSMutableString *content = text.mutableCopy;
    if (content.length == 0) return nil;
    // 字体
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:content];
    attributedText.yy_font = font;
    attributedText.yy_color = textColor;
    
    // 匹配 [表情]
    NSArray<NSTextCheckingResult *> *emoticonResults = [[self regexEmoticon] matchesInString:attributedText.string options:kNilOptions range:attributedText.yy_rangeOfAll];
    NSUInteger emoClipLength = 0;
    for (NSTextCheckingResult *emo in emoticonResults) {
        if (emo.range.location == NSNotFound && emo.range.length <= 1) continue;
        NSRange range = emo.range;
        range.location -= emoClipLength;
        if ([attributedText yy_attribute:YYTextHighlightAttributeName atIndex:range.location]) continue;
        if ([attributedText yy_attribute:YYTextAttachmentAttributeName atIndex:range.location]) continue;
        NSString *emoString = [attributedText.string substringWithRange:range];
        NSString *imagePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:[self emoticon:emoString].png];
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        if (!image) continue;
        
        NSAttributedString *emoText = [NSAttributedString yy_attachmentStringWithEmojiImage:image fontSize:fontSize];
        [attributedText replaceCharactersInRange:range withAttributedString:emoText];
        emoClipLength += range.length - 1;
    }
    return attributedText;
}

@end
