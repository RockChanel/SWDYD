//
//  SWMedalSectionHeader.m
//  SWDYD
//
//  Created by zijin on 2018/9/30.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWMedalSectionHeader.h"

@interface SWMedalSectionHeader()
@property (nonatomic, strong) UILabel *titleLab;
@end
@implementation SWMedalSectionHeader

- (void)setSectionTitle:(NSString *)sectionTitle {
    _sectionTitle = sectionTitle;
    self.titleLab.text = sectionTitle;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    UIView *container = [[UIView alloc]init];
    [self addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.greaterThanOrEqualTo(self);
        make.trailing.lessThanOrEqualTo(self);
        make.top.bottom.centerX.equalTo(@0);
    }];
    
    UIImageView *leftIcon = [[UIImageView alloc]init];
    leftIcon.image = [UIImage imageNamed:@"medal_wall_section_icon_11x14_"];
    [container addSubview:leftIcon];
    [leftIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.equalTo(@0);
    }];
    
    [container addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftIcon.mas_right).offset(15);
        make.centerY.equalTo(@0);
    }];
    
    UIImageView *rightIcon = [[UIImageView alloc]init];
    rightIcon.image = [UIImage imageNamed:@"medal_wall_section_icon_11x14_"];
    [container addSubview:rightIcon];
    [rightIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab.mas_right).offset(15);
        make.right.centerY.equalTo(@0);
    }];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.font = SWBoldFont(13);
        _titleLab.textColor = [UIColor sw_black];
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}

@end
