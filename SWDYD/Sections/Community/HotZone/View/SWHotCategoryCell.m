//
//  SWHotCategoryCell.m
//  SWDYD
//
//  Created by selwyn on 2018/10/1.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWHotCategoryCell.h"
#import "SWHotZoneModel.h"

@interface SWHotCategoryCell()
@property (nonatomic, strong) UIImageView *bgImage;
@property (nonatomic, strong) UILabel *titleLab;
@end
@implementation SWHotCategoryCell

- (void)setInfo:(SWHotCategoryInfo *)info {
    _info = info;
    [self.bgImage sd_setImageWithURL:[NSURL URLWithString:info.subAreaImage] placeholderImage:[UIImage imageNamed:SWLoadImage]];
    self.titleLab.text = info.subAreaName;
}

- (void)setup {
    [self.bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(@0);
    }];
    self.bgImage.layer.cornerRadius = 8.0;

    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);
        make.left.right.equalTo(@0);
    }];
}

- (UIImageView *)bgImage {
    if (!_bgImage) {
        _bgImage = [[UIImageView alloc]init];
        _bgImage.contentMode = UIViewContentModeScaleAspectFill;
        _bgImage.clipsToBounds = YES;
        [self.contentView addSubview:_bgImage];
    }
    return _bgImage;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.font = SWBoldFont(15);
        _titleLab.textColor = [UIColor whiteColor];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLab];
    }
    return _titleLab;
}

@end
