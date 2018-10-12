//
//  SWTimeLineLayout.m
//  SWDYD
//
//  Created by zijin on 2018/10/11.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWTimeLineLayout.h"
#import "SWTimeLineModel.h"
#import "SWTimeLineHelper.h"

@implementation SWTimeLineLayout

- (instancetype)initWithItem:(SWTimeLineItem *)item style:(SWLayoutStyle)style {
    if (!item) return nil;
    self = [super init];
    if (self) {
        _item = item;
        _style = style;
        [self layout];
    }
    return self;
}

- (void)layout {
    [self layoutTitle];
    [self layoutContent];
    [self layoutMainContent];
}

- (void)layoutTitle {
    NSMutableAttributedString *tempTitle = [self text:_item.postTitle fontSize:kSWTimeLineTitleFontSize textColor:kSWTimeLineTitleColor];
    _attributedTitle = tempTitle;
}

- (void)layoutContent {
    NSMutableAttributedString *tempContent = [self text:_item.postContent fontSize:kSWTimeLineContentFontSize textColor:kSWTimeLineContentColor];
    _attributedContent = tempContent;
}

- (void)layoutMainContent {
    
}

- (NSMutableAttributedString *)text:(NSString *)text
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
    NSArray<NSTextCheckingResult *> *emoticonResults = [[SWTimeLineHelper regexEmoticon] matchesInString:attributedText.string options:kNilOptions range:attributedText.yy_rangeOfAll];
    NSUInteger emoClipLength = 0;
    for (NSTextCheckingResult *emo in emoticonResults) {
        if (emo.range.location == NSNotFound && emo.range.length <= 1) continue;
        NSRange range = emo.range;
        range.location -= emoClipLength;
        if ([attributedText yy_attribute:YYTextHighlightAttributeName atIndex:range.location]) continue;
        if ([attributedText yy_attribute:YYTextAttachmentAttributeName atIndex:range.location]) continue;
        NSString *emoString = [attributedText.string substringWithRange:range];
        NSString *imagePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:[SWTimeLineHelper emoticon:emoString].png];
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        if (!image) continue;

        NSAttributedString *emoText = [NSAttributedString yy_attachmentStringWithEmojiImage:image fontSize:fontSize];
        [attributedText replaceCharactersInRange:range withAttributedString:emoText];
        emoClipLength += range.length - 1;
    }
    return attributedText;
}

@end
