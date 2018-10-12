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

@interface SWTimeLineCardView()
@property (nonatomic, strong) NSMutableArray *picViews;
@end
@implementation SWTimeLineCardView

static NSInteger const maxPicCount = 3;

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setLayout:(SWTimeLineLayout *)layout {
    _layout = layout;
    if (_layout.cardType == SWLayoutCardTypeImage) {
        [self layoutImages];
    }
    else {
        [self hideImageViews];
    }
}

- (void)layoutImages {
    for (int i = 0; i < maxPicCount; i++) {
        UIImageView *tempImage = _picViews[i];
        if (i >= _layout.cardPicCount) {
            tempImage.hidden = YES;
        }
        else {
            tempImage.hidden = NO;
            [tempImage sd_setImageWithURL:[NSURL URLWithString:_layout.item.postCoverImageList[i]] placeholderImage:[UIImage imageNamed:kSWLoadeedImage]];
            tempImage.mj_origin = CGPointMake(kSWTimeLinePadding + i*(_layout.cardPickSize.width + kSWTimeLineImageMargin), 0);
            tempImage.mj_size = _layout.cardPickSize;
        }
    }
}

- (void)hideImageViews {
    for (UIImageView *imageView in _picViews) {
        imageView.hidden = YES;
    }
}

- (void)setup {
    NSMutableArray *picViews = [NSMutableArray array];
    for (int i = 0; i < maxPicCount; i++) {
        UIImageView *tempPic = [[UIImageView alloc]init];
        tempPic.clipsToBounds = YES;
        tempPic.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:tempPic];
        [picViews addObject:tempPic];
    }
    _picViews = picViews;
}

@end
