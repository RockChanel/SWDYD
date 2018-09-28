//
//  SWFollowAreaCell.m
//  SWDYD
//
//  Created by zijin on 2018/9/28.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWFollowAreaCell.h"
#import "SWFollowModel.h"

@interface SWFollowAreaCell()
@property (nonatomic, strong) UIImageView *bannerIcon;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *postCountLab;
@property (nonatomic, strong) UIButton *followBtn;
@end
@implementation SWFollowAreaCell

- (void)followAction {
    
}

- (void)setArea:(SWFollowArea *)area {
    _area = area;
    self.titleLab.text = area.subAreaName;
    [self.bannerIcon sd_setImageWithURL:[NSURL URLWithString:area.subAreaHeadImage]];
    self.postCountLab.text = [NSString stringWithFormat:@"贴子数:%@",[SWDYDTool convertIntegerNumber:area.subAreaPostCount.integerValue]];
}

- (void)setup {
    self.clipsToBounds = YES;
    self.layer.borderWidth = 0.5f;
    self.layer.borderColor = [UIColor sw_red:221 green:221 blue:221].CGColor;
    self.layer.cornerRadius = 5.0f;
    
    [self.bannerIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.height.equalTo(self.contentView.mas_width);
    }];
    self.bannerIcon.layer.cornerRadius = 5.0f;
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bannerIcon.mas_bottom).offset(-10);
        make.left.right.equalTo(@0);
    }];
    
    [self.postCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bannerIcon.mas_bottom).offset(8);
        make.left.right.equalTo(@0);
    }];
    
    [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.postCountLab.mas_bottom).offset(5);
        make.height.equalTo(@30);
        make.width.equalTo(@60);
        make.centerX.equalTo(@0);
    }];
    self.followBtn.layer.cornerRadius = 15;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.textColor = [UIColor whiteColor];
        _titleLab.font = SWBoldFont(14);
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLab];
    }
    return _titleLab;
}

- (UILabel *)postCountLab {
    if (!_postCountLab) {
        _postCountLab = [[UILabel alloc]init];
        _postCountLab.textColor = [UIColor sw_darkGray];
        _postCountLab.font = SWFont(13);
        _postCountLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_postCountLab];
    }
    return _postCountLab;
}

- (UIImageView *)bannerIcon {
    if (!_bannerIcon) {
        _bannerIcon = [[UIImageView alloc]init];
        _bannerIcon.clipsToBounds = YES;
        _bannerIcon.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_bannerIcon];
    }
    return _bannerIcon;
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
