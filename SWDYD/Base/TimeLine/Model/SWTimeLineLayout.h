//
//  SWTimeLineLayout.h
//  SWDYD
//
//  Created by zijin on 2018/10/11.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSInteger const kSWMaxPicCount = 3;

/** 顶部留白 */
static CGFloat const kSWTimeLineTopMargin = 7;
/** 左右内边距 */
static CGFloat const kSWTimeLinePadding = 10;
/** 个人资料高度 与头像等高 */
static CGFloat const kSWTimeLineProfileHeight = 40;
/** 昵称高度 */
static CGFloat const kSWTimeLineNameHeight = 22;
/** 昵称和头像间距 */
static CGFloat const kSWTimeLineNamePaddingLeft = 10;
/** 等级徽章宽度 */
static CGFloat const kSWTimeLineLevelWidth = 16;
/** 分享按钮宽高 */
static CGFloat const kSWTimeLineShareWidth = 20;
/** 个人资料和顶部留白间距 */
static CGFloat const kSWTimeLineProfilePaddingTop = 12;
/** 标题和个人资料间距 */
static CGFloat const kSWTimeLineTitlePaddingTop = 15;
/** 文本和标题间距 */
static CGFloat const kSWTimeLineContentPaddingTop = 10;
/** 卡片和文本间距 */
static CGFloat const kSWTimeLineCardPaddingTop = 12;
/** 视频卡片高度 */
static CGFloat const kSWTimeLineCardVideoHeight = 200;
/** 音频卡片高度 */
static CGFloat const kSWTimeLineCardAudioHeight = 70;
/** 音月卡片高度 */
static CGFloat const kSWTimeLineCardMusicHeight = 90;
/** 一张图片卡片高度 */
static CGFloat const kSWTimeLineCardMaxPicHeight = 190;
/** 两张图片卡片高度 */
static CGFloat const kSWTimeLineCardPicHeight = 175;
/** 三张图片卡片高度 */
static CGFloat const kSWTimeLineCardMinPicHeight = 115;
static CGFloat const kSWTimeLinePicMargin = 5;

/** 工具栏和选项卡间距 */
static CGFloat const kSWTimeLineActionPaddingTop = 7;
/** 工具栏高度 */
static CGFloat const kSWTimeLineActionHeight = 40;
/** 工具栏图片宽高 */
static CGFloat const kSWTimeLineActionImageWidth = 20;
/** 工具栏和图片数目间距 */
static CGFloat const kSWTimeLineActionImagePaddingRight = 8;

/** 标题字体 */
static CGFloat const kSWTimeLineTitleFontSize = 16;
/** 文本字体 */
static CGFloat const kSWTimeLineContentFontSize = 14;

/** 标题颜色 */
#define kSWTimeLineTitleColor [UIColor sw_black]
/** 文本颜色 */
#define kSWTimeLineContentColor [UIColor sw_darkGray]
/// 卡片宽度
#define kSWContentWidth (SWScreenWidth - 2 * kSWTimeLinePadding)

/// 风格
typedef NS_ENUM(NSInteger, SWLayoutStyle) {
    SWLayoutStyleTimeline = 0, ///< 时间线
    SWLayoutStyleDetail,       ///< 详情页
};

/// 卡片类型
typedef NS_ENUM(NSInteger, SWLayoutCardType) {
    SWLayoutCardTypeNone = 0, ///< 无内容
    SWLayoutCardTypePic,  ///< 图片
    SWLayoutCardTypeAudio,   /// 音频
    SWLayoutCardTypeVideo,    ///< 视频
    SWLayoutCardTypeMusic,  ///< 音乐
    SWLayoutCardTypeQuestion,    ///< 问卷
};

@class SWTimeLineItem;
@interface SWTimeLineLayout : NSObject
/** 数据源 */
@property (nonatomic, strong) SWTimeLineItem *item;
@property (nonatomic, assign) SWLayoutStyle style;
@property (nonatomic, assign) SWLayoutCardType cardType;

@property (nonatomic, assign) CGFloat cardHeight;
@property (nonatomic, assign) CGFloat picCount;
@property (nonatomic, assign) CGSize picSize;

@property (nonatomic, strong) NSAttributedString *attributedTitle;
@property (nonatomic, strong) NSAttributedString *attributedContent;

- (instancetype)initWithItem:(SWTimeLineItem *)item style:(SWLayoutStyle)style;

@end
