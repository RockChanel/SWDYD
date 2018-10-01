//
//  SWHotCategoryHeaderView.m
//  SWDYD
//
//  Created by selwyn on 2018/10/1.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWHotCategoryHeaderView.h"

@interface SWHotCategoryHeaderView()
@property (nonatomic, strong) UILabel *titleLab;
@end
@implementation SWHotCategoryHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    UIImageView *icon = [[UIImageView alloc]init];
    icon.image = [UIImage imageNamed:@"new_hot_area_header_icon_5x11_"];
    [self addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.centerY.equalTo(@0);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(icon.mas_right).offset(5);
        make.centerY.equalTo(@0);
    }];
}

- (void)setCategory:(NSString *)category {
    _category = category;
    self.titleLab.text = category;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.font = SWFont(16);
        _titleLab.textColor = [UIColor sw_black];
        [self addSubview:_titleLab];
    }
    return _titleLab;
}

@end
