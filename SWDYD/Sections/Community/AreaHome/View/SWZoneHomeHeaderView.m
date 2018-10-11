//
//  SWZoneHomeHeaderView.m
//  SWDYD
//
//  Created by selwyn on 2018/10/3.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWZoneHomeHeaderView.h"
#import "SWZoneHomeModel.h"

@interface SWZoneHomeHeaderView()
@property (nonatomic, strong) UIImageView *bgImage;
@property (nonatomic, strong) UIImageView *headerImage;
@end

@implementation SWZoneHomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setModel:(SWZoneHomeHeaderModel *)model {
    _model = model;
    [self.bgImage sd_setImageWithURL:[NSURL URLWithString:model.subAreaHeadImage] placeholderImage:[UIImage imageNamed:kSWLoadeedImage]];
    [self.headerImage sd_setImageWithURL:[NSURL URLWithString:model.subAreaImage] placeholderImage:[UIImage imageNamed:kSWUserAvatar]];
}

- (void)setup {
    [self.bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(@0);
    }];
    
    UIView *bgEffect = [[UIView alloc]init];
    bgEffect.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    [self addSubview:bgEffect];
    [bgEffect mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(@0);
    }];
    
    [self.headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottom).offset(-175);
        make.width.height.equalTo(@70);
        make.centerX.equalTo(@0);
    }];
    self.headerImage.layer.cornerRadius = 35;
    self.headerImage.backgroundColor = [UIColor sw_red];
}

- (UIImageView *)bgImage {
    if(!_bgImage) {
        _bgImage = [[UIImageView alloc]init];
        _bgImage.contentMode = UIViewContentModeScaleAspectFill;
        _bgImage.clipsToBounds = YES;
        _bgImage.image = [UIImage imageNamed:@"head_bg_100x73_"];
        [self addSubview:_bgImage];
    }
    return _bgImage;
}

- (UIImageView *)headerImage {
    if(!_headerImage) {
        _headerImage = [[UIImageView alloc]init];
        _headerImage.contentMode = UIViewContentModeScaleAspectFill;
        _headerImage.clipsToBounds = YES;
        [self addSubview:_headerImage];
    }
    return _headerImage;
}


@end
