//
//  SWMedalCell.m
//  SWDYD
//
//  Created by zijin on 2018/9/30.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWMedalCell.h"
#import "SWMedalModel.h"

@interface SWMedalCell()
/** 图标 */
@property (nonatomic, strong) UIImageView *icon;
/** 标题 */
@property (nonatomic, strong) UILabel *titleLab;
@end
@implementation SWMedalCell

- (void)setMedal:(SWMedal *)medal {
    _medal = medal;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:medal.medalImage] placeholderImage:[UIImage imageNamed:SWLoadImage]];
    self.titleLab.text = medal.medalName;
}

- (void)setup {
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.centerX.equalTo(@0);
        make.height.with.equalTo(@80);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon.mas_bottom).offset(15);
        make.left.right.equalTo(@0);
    }];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.textColor = [UIColor sw_darkGray];
        _titleLab.font = SWFont(11);
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLab];
    }
    return _titleLab;
}

- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc]init];
        _icon.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_icon];
    }
    return _icon;
}

@end
