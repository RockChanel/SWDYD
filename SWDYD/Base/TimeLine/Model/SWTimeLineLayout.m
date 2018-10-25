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
    [self layoutCard];
}

- (void)layoutTitle {
    NSMutableAttributedString *tempTitle = [SWTimeLineHelper text:_item.postTitle fontSize:kSWTimeLineTitleFontSize textColor:kSWTimeLineTitleColor];
    _attributedTitle = tempTitle;
}

- (void)layoutContent {
    NSMutableAttributedString *tempContent = [SWTimeLineHelper text:_item.postContent fontSize:kSWTimeLineContentFontSize textColor:kSWTimeLineContentColor];
    _attributedContent = tempContent;
}

- (void)layoutCard {
    if (_item.postVideo) {
        _cardHeight = kSWTimeLineCardVideoHeight;
        _cardType = SWLayoutCardTypeVideo;
    }
    else if (_item.postMusic) {
        if ([_item.postMusic.musicType isEqualToString:@"voice"]) {
            _cardHeight = kSWTimeLineCardAudioHeight;
            _cardType = SWLayoutCardTypeAudio;
        }
        else {
            _cardHeight = kSWTimeLineCardMusicHeight;
            _cardType = SWLayoutCardTypeMusic;
        }
    }
    else if (_item.postCoverImageList && _item.postCoverImageList.count > 0) {
        _cardType = SWLayoutCardTypePic;
        NSArray *coverList = _item.postCoverImageList;
        if (coverList.count == 1) {
            _cardHeight = kSWTimeLineCardMaxPicHeight;
            _picCount = 1;
        }else if (coverList.count == 2) {
            _cardHeight = kSWTimeLineCardPicHeight;
            _picCount = 2;
        }else {
            _cardHeight = kSWTimeLineCardMinPicHeight;
            _picCount = kSWMaxPicCount;
        }
        CGFloat picWidth = (kSWContentWidth - (_picCount-1)*kSWTimeLinePicMargin)/_picCount;
        _picSize = CGSizeMake(picWidth, _cardHeight);
    }
    else {
        _cardHeight = 0;
        _cardType = SWLayoutCardTypeNone;
    }
}

@end
