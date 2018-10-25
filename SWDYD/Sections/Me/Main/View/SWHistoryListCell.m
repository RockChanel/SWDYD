//
//  SWHistoryListCell.m
//  SWDYD
//
//  Created by zijin on 2018/10/25.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWHistoryListCell.h"

@interface SWHistoryListCell()
@property (nonatomic, strong) YYLabel *titleLab;
@property (nonatomic, strong) YYLabel *contentLab;
@end
@implementation SWHistoryListCell

- (void)setup {
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}

- (YYLabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[YYLabel alloc]init];
        [self.contentView addSubview:_titleLab];
    }
    return _titleLab;
}

- (YYLabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [[YYLabel alloc]init];
        [self.contentView addSubview:_contentLab];
    }
    return _contentLab;
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
