//
//  SWSettingListCell.m
//  SWDYD
//
//  Created by zijin on 2018/10/9.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWSettingListCell.h"
#import "SWSettingModel.h"

@interface SWSettingListCell()
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *detailLab;
@end
@implementation SWSettingListCell

- (void)setModel:(SWSettingModel *)model {
    _model = model;
    self.titleLab.text = model.title;
}

- (void)setup {
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.centerY.equalTo(@0);
    }];
    
    [self.detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab.mas_right).offset(10);
        make.right.equalTo(@(-15));
        make.centerY.equalTo(@0);
    }];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.textColor = [UIColor sw_black];
        _titleLab.font = SWFont(16);
        [self.contentView addSubview:_titleLab];
    }
    return _titleLab;
}

- (UILabel *)detailLab {
    if (!_detailLab) {
        _detailLab = [[UILabel alloc]init];
        _detailLab.textColor = [UIColor sw_gray];
        _detailLab.font = SWFont(16);
        _detailLab.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_detailLab];
    }
    return _detailLab;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
