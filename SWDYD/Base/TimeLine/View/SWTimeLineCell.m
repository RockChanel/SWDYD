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

@interface SWTimeLineCell()
@property (nonatomic, strong) SWTimeLineActionView *actionView;
@property (nonatomic, strong) SWTimeLineProfileView *profileView;
@end
@implementation SWTimeLineCell

- (void)setup {
    UIView *topSeparator = [[UIView alloc]init];
    topSeparator.backgroundColor = [UIColor sw_tableBg];
    [self.contentView addSubview:topSeparator];
    [topSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.height.equalTo(@7);
    }];
    
    [self.profileView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topSeparator.mas_bottom).offset(12);
        make.left.right.equalTo(@0);
        make.height.equalTo(@40);
    }];
    
    [self.actionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.profileView.mas_bottom);
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@40);
    }];
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
