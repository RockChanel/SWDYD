//
//  SWFollowUserCell.m
//  SWDYD
//
//  Created by zijin on 2018/9/28.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWFollowUserCell.h"
#import "SWFollowModel.h"

@interface SWFollowUserCell()
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *tagLab;
@property (nonatomic, strong) UIButton *followBtn;
@property (nonatomic, strong) UIImageView *headerIcon;
@end
@implementation SWFollowUserCell

- (void)setUser:(SWFollowUser *)user {
    _user = user;
    self.nameLab.text = user.nickName;
    self.tagLab.text = user.userRecommendStmt;
    [self.headerIcon sd_setImageWithURL:[NSURL URLWithString:user.avatar] placeholderImage:[UIImage imageNamed:kSWUserAvatar]];
}

- (void)followAction {
    
}

- (void)setup {
    [self.headerIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerX.equalTo(@0);
        make.width.height.equalTo(@54);
    }];
    self.headerIcon.layer.cornerRadius = 27;
    
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.top.equalTo(self.headerIcon.mas_bottom).offset(10);
    }];
    
    [self.tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.top.equalTo(self.nameLab.mas_bottom).offset(5);
    }];
    
    [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagLab.mas_bottom).offset(20);
        make.height.equalTo(@30);
        make.width.equalTo(@60);
        make.centerX.equalTo(@0);
    }];
    self.followBtn.layer.cornerRadius = 15;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [[UILabel alloc]init];
        _nameLab.textColor = [UIColor sw_black];
        _nameLab.font = SWBoldFont(14);
        _nameLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_nameLab];
    }
    return _nameLab;
}

- (UILabel *)tagLab {
    if (!_tagLab) {
        _tagLab = [[UILabel alloc]init];
        _tagLab.textColor = [UIColor sw_gray];
        _tagLab.font = SWFont(11);
        _tagLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_tagLab];
    }
    return _tagLab;
}

- (UIImageView *)headerIcon {
    if (!_headerIcon) {
        _headerIcon = [[UIImageView alloc]init];
        _headerIcon.clipsToBounds = YES;
        _headerIcon.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_headerIcon];
    }
    return _headerIcon;
}

- (UIButton *)followBtn {
    if (!_followBtn) {
        _followBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_followBtn setTitle:@"+ 关注" forState:UIControlStateNormal];
        [_followBtn setTitleColor:[UIColor sw_black] forState:UIControlStateNormal];
        _followBtn.layer.borderWidth = 1.0f;
        _followBtn.layer.borderColor = [UIColor sw_black].CGColor;
        _followBtn.titleLabel.font = SWFont(13);
        [_followBtn addTarget:self action:@selector(followAction) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_followBtn];
    }
    return _followBtn;
}

@end
