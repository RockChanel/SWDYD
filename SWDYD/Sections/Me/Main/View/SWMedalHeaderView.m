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
/** 佩戴勋章 */
@property (nonatomic, strong) UIImageView *medalIcon;
/** 获得勋章 */
@property (nonatomic, strong) UILabel *medalLab;
@end
@implementation SWMedalHeaderView

- (void)setNickName:(NSString *)nickName {
    _nickName = nickName;
    self.nickNameLab.text = nickName;
}

- (void)setMedalCount:(NSInteger)medalCount {

}

- (void)setAvatar:(NSString *)avatar {
    _avatar = avatar;
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:avatar] placeholderImage:[UIImage imageNamed:SWUserAvatar]];
}

- (void)setMedal:(NSString *)medal {
    _medal = medal;
    [self.medalIcon sd_setImageWithURL:[NSURL URLWithString:medal]];
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

- (UIImageView *)medalIcon {
    if (!_medalIcon) {
        _medalIcon = [[UIImageView alloc]init];
        [self addSubview:_medalIcon];
    }
    return _medalIcon;
}

- (UILabel *)nickNameLab {
    if (!_nickNameLab) {
        _nickNameLab = [[UILabel alloc]init];
        _nickNameLab.font = [UIFont systemFontOfSize:12];
        _nickNameLab.textColor = [UIColor whiteColor];
        _nickNameLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_nickNameLab];
    }
    return _nickNameLab;
}

- (UILabel *)medalLab {
    if (!_medalLab) {
        _medalLab = [[UILabel alloc]init];
        _medalLab.font = [UIFont systemFontOfSize:15];
        _medalLab.textColor = [UIColor whiteColor];
        _medalLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_medalLab];
    }
    return _medalLab;
}

@end
