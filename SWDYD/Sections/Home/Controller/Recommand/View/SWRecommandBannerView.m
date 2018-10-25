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

@interface SWBottomBannerView()
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIImageView *bgImage;
@end
@implementation SWBottomBannerView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setBanner:(SWRecommandBanner *)banner {
    _banner = banner;
    [self.bgImage sd_setImageWithURL:[NSURL URLWithString:_banner.promotionImage] placeholderImage:[UIImage imageNamed:kSWLoadeedImage]];
    self.titleLab.text = _banner.promotionTitle;
}

- (void)setup {
    [self.bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(@0);
    }];
    
    UIView *blurView = [[UIView alloc]init];
    blurView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [self addSubview:blurView];
    
    [blurView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@20);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(blurView);
    }];
}

- (UIImageView *)bgImage {
    if (!_bgImage) {
        _bgImage = [[UIImageView alloc]init];
        _bgImage.clipsToBounds = YES;
        _bgImage.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_bgImage];
    }
    return _bgImage;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.font = SWFont(12);
        _titleLab.textColor = [UIColor whiteColor];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLab];
    }
    return _titleLab;
}
@end

@interface SWRecommandBannerView()
@property (nonatomic, strong) SDCycleScrollView *bannerScrollView;
@property (nonatomic, strong) UIView *bannerContainer;
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
    
    for (UIView *subView in [self.bannerContainer subviews]) {
        [subView removeFromSuperview];
    }
    if (_list.promotionBulletinList && _list.promotionBulletinList.count > 0) {
        NSMutableArray *masBanners = [NSMutableArray array];
        for (int i = 0; i < _list.promotionBulletinList.count; i++) {
            SWBottomBannerView *bannerView = [[SWBottomBannerView alloc]init];
            bannerView.banner = _list.promotionBulletinList[i];
            [self.bannerContainer addSubview:bannerView];
            [masBanners addObject:bannerView];
        }
        [masBanners mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:5 leadSpacing:0 tailSpacing:0];
        [masBanners mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(@0);
        }];
    }
}

- (void)setup {
    self.backgroundColor = [UIColor whiteColor];
    
    [self.bannerScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.height.equalTo(@160);
    }];
    
    [self.bannerContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.top.equalTo(self.bannerScrollView.mas_bottom).offset(5);
    }];
}

- (UIView *)bannerContainer {
    if (!_bannerContainer) {
        _bannerContainer = [[UIView alloc]init];
        [self addSubview:_bannerContainer];
    }
    return _bannerContainer;
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
