//
//  SWRefreshGifHeader.m
//  SWDYD
//
//  Created by zijin on 2018/10/19.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWRefreshGifHeader.h"
#import <FLAnimatedImage/FLAnimatedImage.h>

@interface SWRefreshGifHeader()
@property (nonatomic, strong) FLAnimatedImageView *gifImageView;
@end
@implementation SWRefreshGifHeader

- (void)prepare {
    [super prepare];
    
    self.lastUpdatedTimeLabel.hidden = YES;
    self.stateLabel.hidden = YES;
    
    [self.gifImageView stopAnimating];
    [self.gifImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@160);
        make.height.equalTo(@46);
        make.centerX.bottom.equalTo(@0);
    }];
}

- (FLAnimatedImageView *)gifImageView {
    if (!_gifImageView) {
        _gifImageView = [[FLAnimatedImageView alloc]init];
        NSString *gifPath = [[NSBundle mainBundle] pathForResource:@"pullDownRefresh" ofType:@"gif"];
        NSData *gifData = [NSData dataWithContentsOfFile:gifPath];
        FLAnimatedImage *gifImage = [FLAnimatedImage animatedImageWithGIFData:gifData];
        _gifImageView.animatedImage = gifImage;
        [self addSubview:_gifImageView];
    }
    return _gifImageView;
}

- (void)setState:(MJRefreshState)state {
    MJRefreshCheckState
    
    if (state == MJRefreshStatePulling || state == MJRefreshStateRefreshing) {
        [self.gifImageView startAnimating];
    }
    else if (state == MJRefreshStateIdle) {
        [self.gifImageView stopAnimating];
    }
}

@end
