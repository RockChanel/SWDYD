//
//  SWMedalHeaderView.m
//  SWDYD
//
//  Created by selwyn on 2018/9/29.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWMedalHeaderView.h"

@interface SWMedalHeaderView()
/** 头像 */
@property (nonatomic, strong) UIImageView *headImage;
/** 昵称 */
@property (nonatomic, strong) UILabel *nickNameLab;
/** 获得勋章 */
@property (nonatomic, strong) UILabel *medalLab;
@end
@implementation SWMedalHeaderView

- (void)setNickName:(NSString *)nickName {
    _nickName = nickName;
    self.nickNameLab.text = nickName;
}

- (void)setMedalCount:(NSInteger)medalCount {
    self.medalLab.text = [NSString stringWithFormat:@"已获得%ld枚勋章", (long)medalCount];
}

- (void)setAvatar:(NSString *)avatar {
    _avatar = avatar;
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:avatar] placeholderImage:[UIImage imageNamed:SWUserAvatar]];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    UIImageView *bgImage = [[UIImageView alloc]init];
    bgImage.image = [UIImage imageNamed:@"medal_wall_top_bg_375x302_"];
    [self addSubview:bgImage];
    [bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(@0);
    }];
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@70);
        make.width.height.equalTo(@76);
        make.centerX.equalTo(@0);
    }];
    self.headImage.layer.cornerRadius = 38;
    
    [self.nickNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImage.mas_bottom).offset(50);
        make.centerX.equalTo(@0);
    }];
    
    [self.medalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nickNameLab.mas_bottom).offset(12);
        make.centerX.equalTo(@0);
    }];
}

- (UIImageView *)headImage {
    if (!_headImage) {
        _headImage = [[UIImageView alloc]init];
        _headImage.clipsToBounds = YES;
        _headImage.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_headImage];
    }
    return _headImage;
}

- (UILabel *)nickNameLab {
    if (!_nickNameLab) {
        _nickNameLab = [[UILabel alloc]init];
        _nickNameLab.font = SWFont(12);
        _nickNameLab.textColor = [UIColor whiteColor];
        _nickNameLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_nickNameLab];
    }
    return _nickNameLab;
}

- (UILabel *)medalLab {
    if (!_medalLab) {
        _medalLab = [[UILabel alloc]init];
        _medalLab.font = SWFont(15);
        _medalLab.textColor = [UIColor whiteColor];
        _medalLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_medalLab];
    }
    return _medalLab;
}

@end
