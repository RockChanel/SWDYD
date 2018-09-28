//
//  SWFollowHeaderView.m
//  SWDYD
//
//  Created by zijin on 2018/9/28.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWFollowHeaderView.h"

@interface SWFollowHeaderView()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *titleLab;
@end
@implementation SWFollowHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor whiteColor];
    
    UIView *separator = [[UIView alloc]init];
    separator.backgroundColor = [UIColor sw_tableBg];
    [self addSubview:separator];
    [separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(@0);
        make.height.equalTo(@10);
    }];
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right).offset(10);
        make.centerY.equalTo(self.icon);
    }];
}

- (void)setIconName:(NSString *)iconName {
    _iconName = iconName;
    self.icon.image = [UIImage imageNamed:iconName];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLab.text = title;
}

- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc]init];
        [self addSubview:_icon];
    }
    return _icon;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.font = SWFont(13);
        _titleLab.textColor = [UIColor sw_darkGray];
        [self addSubview:_titleLab];
    }
    return _titleLab;
}

@end
