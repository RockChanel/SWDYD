//
//  SWRecommandBannerView.m
//  SWDYD
//
//  Created by zijin on 2018/10/9.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWRecommandBannerView.h"
#import "SDCycleScrollView.h"
#import "SWRecommandModel.h"

@interface SWRecommandBannerView()
@property (nonatomic, strong) SDCycleScrollView *bannerScrollView;
@end
@implementation SWRecommandBannerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setList:(SWRecommandBannerList *)list {
    _list = list;
    NSMutableArray *bannerUrls = [NSMutableArray array];
    [_list.promotionList enumerateObjectsUsingBlock:^(SWRecommandBanner * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [bannerUrls addObject:obj.promotionImage];
    }];
    self.bannerScrollView.imageURLStringsGroup = bannerUrls;
}

- (void)setup {
    self.backgroundColor = [UIColor whiteColor];
    
    [self.bannerScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.bottom.equalTo(@(-80));
    }];
}

- (SDCycleScrollView *)bannerScrollView {
    if (!_bannerScrollView) {
        _bannerScrollView = [[SDCycleScrollView alloc]init];
        _bannerScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        _bannerScrollView.backgroundColor = [UIColor whiteColor];
        _bannerScrollView.pageDotColor = [UIColor whiteColor];
        _bannerScrollView.autoScrollTimeInterval = 3.0;
        _bannerScrollView.currentPageDotColor = [UIColor sw_red:254 green:168 blue:48];
        [self addSubview:_bannerScrollView];
    }
    return _bannerScrollView;
}

@end
