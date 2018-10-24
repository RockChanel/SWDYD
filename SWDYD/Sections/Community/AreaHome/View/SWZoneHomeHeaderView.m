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
@property (nonatomic, strong) UILabel *memberLab;
@property (nonatomic, strong) UILabel *postLab;
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
    [self.bgImage sd_setImageWithURL:[NSURL URLWithString:_model.subAreaHeadImage] placeholderImage:[UIImage imageNamed:kSWLoadeedImage]];
    [self.headerImage sd_setImageWithURL:[NSURL URLWithString:_model.subAreaImage] placeholderImage:[UIImage imageNamed:kSWUserAvatar]];
    self.memberLab.text = [NSString stringWithFormat:@"%@：%@", _model.subAreaUserCountName, _model.subAreaUserCount];
    self.postLab.text = [NSString stringWithFormat:@"%@：%@", _model.subAreaPostCountName, _model.subAreaPostCount];
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
    
    [self.memberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_centerX).offset(-20);
        make.top.equalTo(self.headerImage.mas_bottom).offset(15);
    }];
    
    [self.postLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_centerX).offset(20);
        make.top.equalTo(self.headerImage.mas_bottom).offset(15);
    }];
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

- (UILabel *)memberLab {
    if (!_memberLab) {
        _memberLab = [[UILabel alloc]init];
        _memberLab.textColor = [UIColor whiteColor];
        _memberLab.textAlignment = NSTextAlignmentRight;
        _memberLab.font = SWFont(13);
        [self addSubview:_memberLab];
    }
    return _memberLab;
}

- (UILabel *)postLab {
    if (!_postLab) {
        _postLab = [[UILabel alloc]init];
        _postLab.textColor = [UIColor whiteColor];
        _postLab.font = SWFont(13);
        [self addSubview:_postLab];
    }
    return _postLab;
}

@end
