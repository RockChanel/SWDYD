//
//  SWTimeLineProfileView.m
//  SWDYD
//
//  Created by zijin on 2018/10/10.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWTimeLineProfileView.h"

@interface SWTimeLineProfileView()
@property (nonatomic, strong) UIImageView *avatarImage;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *dateLab;
@property (nonatomic, strong) UIButton *shareBtn;
@end
@implementation SWTimeLineProfileView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self.avatarImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.left.equalTo(@10);
        make.width.height.equalTo(@40);
    }];
    self.avatarImage.layer.cornerRadius = 20;
    self.avatarImage.backgroundColor = [UIColor sw_red];
}

- (UIImageView *)avatarImage {
    if (!_avatarImage) {
        _avatarImage = [[UIImageView alloc]init];
        _avatarImage.contentMode = UIViewContentModeScaleAspectFill;
        _avatarImage.clipsToBounds = YES;
        [self addSubview:_avatarImage];
    }
    return _avatarImage;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [[UILabel alloc]init];
        _nameLab.font = SWFont(13);
        _nameLab.textColor = [UIColor sw_darkGray];
        _nameLab.text = @"0";
    }
    return _nameLab;
}


@end
