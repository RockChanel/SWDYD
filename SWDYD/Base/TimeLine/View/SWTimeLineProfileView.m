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

@interface SWTimeLineProfileView()
@property (nonatomic, strong) UIImageView *avatarImage;
@property (nonatomic, strong) UILabel *nickNameLab;
@property (nonatomic, strong) UILabel *dateLab;
@property (nonatomic, strong) UIButton *shareBtn;
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
    self.nickNameLab.text = _layout.item.postAuthorName;
    [self.avatarImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", kSWImageBaseURL, _layout.item.postAuthorAvatar]] placeholderImage:[UIImage imageNamed:kSWUserAvatar]];
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

    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nickNameLab.mas_bottom);
        make.bottom.equalTo(@0);
        make.left.equalTo(self.nickNameLab);
    }];
    self.dateLab.text = @"3小时前";
    
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-kSWTimeLinePadding));
        make.top.equalTo(@0);
        make.width.height.equalTo(@(kSWTimeLineShareWidth));
    }];
}

- (void)shareAction {
    
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
