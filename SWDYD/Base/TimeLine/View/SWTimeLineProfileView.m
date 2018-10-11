//
//  SWTimeLineProfileView.m
//  SWDYD
//
//  Created by zijin on 2018/10/10.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWTimeLineProfileView.h"

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

- (void)setup {
    [self.avatarImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.left.equalTo(@10);
        make.width.height.equalTo(@40);
    }];
    self.avatarImage.layer.cornerRadius = 20;
    self.avatarImage.backgroundColor = [UIColor sw_red];
    
    [self.nickNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarImage.mas_right).offset(10);
        make.top.equalTo(@0);
        make.height.equalTo(@22);
    }];
    self.nickNameLab.text = @"Selwyn";

    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nickNameLab.mas_bottom);
        make.bottom.equalTo(@0);
        make.left.equalTo(self.nickNameLab);
    }];
    self.dateLab.text = @"3小时前";
    
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-10));
        make.top.equalTo(@0);
        make.width.height.equalTo(@20);
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
