//
//  SWMeCell.m
//  SWDYD
//
//  Created by zijin on 2018/9/29.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWMeCell.h"
#import "SWMeModel.h"

@interface SWMeCell()
/** 图标 */
@property (nonatomic, strong) UIImageView *icon;
/** 标题 */
@property (nonatomic, strong) UILabel *titleLab;
@end
@implementation SWMeCell

- (void)setModel:(SWMeModel *)model {
    _model = model;
    self.icon.image = [UIImage imageNamed:model.icon];
    self.titleLab.text = model.title;
}

- (void)setup {
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.centerX.equalTo(@0);
        make.height.with.equalTo(@32);
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
        [self.contentView addSubview:_icon];
    }
    return _icon;
}

@end
