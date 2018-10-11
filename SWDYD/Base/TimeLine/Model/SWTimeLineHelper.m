//
//  SWTimeLineHelper.m
//  SWDYD
//
//  Created by zijin on 2018/10/11.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWTimeLineHelper.h"
#import "SWTimeLineModel.h"

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

@end
