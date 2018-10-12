//
//  SWTimeLineProfileView.m
//  SWDYD
//
//  Created by zijin on 2018/10/10.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWTimeLineProfileView.h"
#import "SWTimeLineLayout.h"
#import "SWTimeLineModel.h"
#import "SWMedalModel.h"
#import "SWTimeLineHelper.h"

@interface SWTimeLineProfileView()
@property (nonatomic, strong) UIImageView *avatarImage;
@property (nonatomic, strong) UILabel *nickNameLab;
@property (nonatomic, strong) UILabel *dateLab;
@property (nonatomic, strong) UIButton *shareBtn;
@property (nonatomic, strong) UIImageView *levelImage;
@property (nonatomic, strong) UIView *medalContainer;
@end
@implementation SWTimeLineProfileView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setLayout:(SWTimeLineLayout *)layout {
    _layout = layout;
    self.nickNameLab.text = _layout.item.postAuthor.nickName;
    [self.avatarImage sd_setImageWithURL:[NSURL URLWithString:_layout.item.postAuthor.avatar] placeholderImage:[UIImage imageNamed:kSWUserAvatar]];
    
    UIImage *levelImage = [UIImage imageNamed:[NSString stringWithFormat:@"person_level%ld", (long)_layout.item.postAuthor.userLevel]];
    CGFloat levelHeight = (levelImage.size.height/levelImage.size.width)*kSWTimeLineLevelWidth;
    [self.levelImage mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(kSWTimeLineLevelWidth));
        make.height.equalTo(@(levelHeight));
    }];
    self.levelImage.image = levelImage;
    self.dateLab.text = [SWTimeLineHelper shortDateDesc:[SWTimeLineHelper date:_layout.item.postLatestUpdateTime]];
}

- (void)shareAction {
    
}

- (void)setup {
    [self.avatarImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.left.equalTo(@(kSWTimeLinePadding));
        make.width.height.equalTo(@(kSWTimeLineProfileHeight));
    }];
    self.avatarImage.layer.cornerRadius = kSWTimeLineProfileHeight/2;
    
    [self.nickNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarImage.mas_right).offset(kSWTimeLineNamePaddingLeft);
        make.top.equalTo(@0);
        make.height.equalTo(@(kSWTimeLineNameHeight));
    }];
    
    [self.levelImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nickNameLab.mas_right).offset(5);
        make.centerY.equalTo(self.nickNameLab);
    }];
    
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nickNameLab.mas_bottom);
        make.bottom.equalTo(@0);
        make.left.equalTo(self.nickNameLab);
    }];
    
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-kSWTimeLinePadding));
        make.top.equalTo(@0);
        make.width.height.equalTo(@(kSWTimeLineShareWidth));
    }];
}

- (UIView *)medalContainer {
    if (!_medalContainer) {
        _medalContainer = [[UIView alloc]init];
        [self addSubview:_medalContainer];
    }
    return _medalContainer;
}

- (UIButton *)shareBtn {
    if (!_shareBtn) {
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareBtn setImage:[UIImage imageNamed:@"homeRec_moreFunc_20x20_"] forState:UIControlStateNormal];
        [_shareBtn addTarget:self action:@selector(shareAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_shareBtn];
    }
    return _shareBtn;
}

- (UIImageView *)avatarImage {
    if (!_avatarImage) {
        _avatarImage = [[UIImageView alloc]init];
        _avatarImage.contentMode = UIViewContentModeScaleAspectFill;
        _avatarImage.clipsToBounds = YES;
        [self addSubview:_avatarImage];
    }
    return _avatarImage;
}

- (UIImageView *)levelImage {
    if (!_levelImage) {
        _levelImage = [[UIImageView alloc]init];
        [self addSubview:_levelImage];
    }
    return _levelImage;
}

- (UILabel *)nickNameLab {
    if (!_nickNameLab) {
        _nickNameLab = [[UILabel alloc]init];
        _nickNameLab.font = SWFont(15);
        _nickNameLab.textColor = [UIColor sw_black];
        _nickNameLab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_nickNameLab];
    }
    return _nickNameLab;
}

- (UILabel *)dateLab {
    if (!_dateLab) {
        _dateLab = [[UILabel alloc]init];
        _dateLab.font = SWFont(10);
        _dateLab.textColor = [UIColor sw_gray];
        _dateLab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_dateLab];
    }
    return _dateLab;
}


@end
