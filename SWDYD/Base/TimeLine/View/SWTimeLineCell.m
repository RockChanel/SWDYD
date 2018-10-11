//
//  SWTimeLineCell.m
//  SWDYD
//
//  Created by zijin on 2018/10/10.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWTimeLineCell.h"
#import "SWTimeLineActionView.h"
#import "SWTimeLineProfileView.h"
#import "SWTimeLineModel.h"
#import "SWTimeLineLayout.h"

@interface SWTimeLineCell()
@property (nonatomic, strong) YYLabel *titleLab;
@property (nonatomic, strong) YYLabel *contentLab;
@property (nonatomic, strong) SWTimeLineActionView *actionView;
@property (nonatomic, strong) SWTimeLineProfileView *profileView;
@end
@implementation SWTimeLineCell

- (void)setLayout:(SWTimeLineLayout *)layout {
    _layout = layout;
    self.titleLab.attributedText = _layout.attributedTitle;
    self.contentLab.attributedText = _layout.attributedContent;
    self.profileView.layout = _layout;
}

- (void)setup {
    UIView *topSeparator = [[UIView alloc]init];
    topSeparator.backgroundColor = [UIColor sw_tableBg];
    [self.contentView addSubview:topSeparator];
    [topSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.height.equalTo(@(kSWTimeLineTopMargin));
    }];
    
    [self.profileView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topSeparator.mas_bottom).offset(kSWTimeLineProfilePaddingTop);
        make.left.right.equalTo(@0);
        make.height.equalTo(@(kSWTimeLineProfileHeight));
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.profileView.mas_bottom).offset(kSWTimeLineTitlePaddingTop);
        make.left.equalTo(@(kSWTimeLinePadding));
        make.right.equalTo(@(-kSWTimeLinePadding));
    }];
    
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleLab);
        make.top.equalTo(self.titleLab.mas_bottom).offset(kSWTimeLineContentPaddingTop);
    }];
    
    [self.actionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLab.mas_bottom);
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@(kSWTimeLineActionHeight));
    }];
}

- (YYLabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [YYLabel new];
        [self.contentView addSubview:_titleLab];
    }
    return _titleLab;
}

- (YYLabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [YYLabel new];
        [self.contentView addSubview:_contentLab];
    }
    return _contentLab;
}

- (SWTimeLineActionView *)actionView {
    if (!_actionView) {
        _actionView = [[SWTimeLineActionView alloc]init];
        [self.contentView addSubview:_actionView];
    }
    return _actionView;
}

- (SWTimeLineProfileView *)profileView {
    if (!_profileView) {
        _profileView = [[SWTimeLineProfileView alloc]init];
        [self.contentView addSubview:_profileView];
    }
    return _profileView;
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
