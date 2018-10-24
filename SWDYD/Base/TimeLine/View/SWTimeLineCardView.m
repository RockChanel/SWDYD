//
//  SWTimeLineCardView.m
//  SWDYD
//
//  Created by zijin on 2018/10/12.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWTimeLineCardView.h"
#import "SWTimeLineModel.h"
#import "SWTimeLineLayout.h"
#import "SWTimeLineMusicView.h"

@interface SWTimeLineCardView()
@property (nonatomic, strong) NSMutableArray *picViews;
@property (nonatomic, strong) SWTimeLineMusicView *musicView;
@end
@implementation SWTimeLineCardView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setLayout:(SWTimeLineLayout *)layout {
    _layout = layout;
    switch (_layout.cardType) {
        case SWLayoutCardTypePic:
        {
            [self layoutPics];
        }
            break;
        case SWLayoutCardTypeMusic:
        {
            [self layoutMusic];
        }
            break;
        default:
        {
            [self hidePics];
            self.musicView.hidden = YES;
        }
            break;
    }
}

- (void)layoutMusic {
    [self hidePics];
    self.musicView.hidden = NO;
    self.musicView.music = _layout.item.postMusic;
}

- (void)layoutPics {
    self.musicView.hidden = YES;

    for (int i = 0; i < kSWMaxPicCount; i++) {
        UIImageView *tempImage = _picViews[i];
        if (i >= _layout.picCount) {
            tempImage.hidden = YES;
        }
        else {
            tempImage.hidden = NO;
            [tempImage sd_setImageWithURL:[NSURL URLWithString:_layout.item.postCoverImageList[i]] placeholderImage:[UIImage imageNamed:kSWLoadeedImage]];
            tempImage.mj_origin = CGPointMake(kSWTimeLinePadding + i*(_layout.picSize.width + kSWTimeLinePicMargin), 0);
            tempImage.mj_size = _layout.picSize;
        }
    }
}

- (void)hidePics {
    for (UIImageView *imageView in _picViews) {
        imageView.hidden = YES;
    }
}

- (void)setup {
    NSMutableArray *picViews = [NSMutableArray array];
    for (int i = 0; i < kSWMaxPicCount; i++) {
        UIImageView *tempPic = [[UIImageView alloc]init];
        tempPic.clipsToBounds = YES;
        tempPic.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:tempPic];
        [picViews addObject:tempPic];
    }
    _picViews = picViews;
    
    self.musicView = [[SWTimeLineMusicView alloc]init];
    self.musicView.hidden = YES;
    [self addSubview:_musicView];
    [self.musicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(@0);
        make.left.equalTo(@(kSWTimeLinePadding));
        make.right.equalTo(@(-kSWTimeLinePadding));
    }];
}

@end
