//
//  SWTopTimeLineCell.m
//  SWDYD
//
//  Created by zijin on 2018/10/18.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWTopTimeLineCell.h"
#import "SWTimeLineLayout.h"
#import "SWTimeLineModel.h"

@interface SWTopTimeLineCell()
@property (nonatomic, strong) UILabel *topLab;
@property (nonatomic, strong) UILabel *contentLab;
@end
@implementation SWTopTimeLineCell

- (void)setup {
    [self.topLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(kSWTimeLinePadding));
        make.width.height.equalTo(@20);
        make.top.equalTo(@(kSWTimeLinePadding));
        make.bottom.equalTo(@(-kSWTimeLinePadding));
    }];
    
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.topLab.mas_right).offset(20);
        make.centerY.equalTo(self.topLab);
        make.right.equalTo(@(-kSWTimeLinePadding));
    }];
    
    UIView *separator = [[UIView alloc]init];
    separator.backgroundColor = [UIColor sw_tableBg];
    [self addSubview:separator];
    [separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@(0.5));
    }];
}

- (void)setItem:(SWTimeLineItem *)item {
    _item = item;
    self.contentLab.text = _item.postTitle;
    if (_item.postHonour.count > 0) {
        NSString *firstHonour = _item.postHonour.firstObject;
        if ([firstHonour isEqualToString:@"置顶"]) {
            self.topLab.text = @"顶";
            self.topLab.backgroundColor = [UIColor sw_red];
        }
        else if ([firstHonour isEqualToString:@"精华"]) {
            self.topLab.text = @"精";
            self.topLab.backgroundColor = [UIColor sw_red:253 green:178 blue:85];
        }
        else {
            self.topLab.text = @"";
            self.topLab.backgroundColor = [UIColor clearColor];
        }
    }
    else {
        self.topLab.text = @"";
        self.topLab.backgroundColor = [UIColor clearColor];
    }
}

- (UILabel *)topLab {
    if (!_topLab) {
        _topLab = [[UILabel alloc]init];
        _topLab.font = SWFont(kSWTimeLineContentFontSize);
        _topLab.textColor = [UIColor whiteColor];
        _topLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_topLab];
    }
    return _topLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [[UILabel alloc]init];
        _contentLab.font = SWFont(kSWTimeLineContentFontSize);
        _contentLab.textColor = [UIColor sw_black];
        [self addSubview:_contentLab];
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
