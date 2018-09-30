//
//  SWMeHeaderView.m
//  SWDYD
//
//  Created by zijin on 2018/9/30.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWMeHeaderView.h"

@interface SWMeHeaderView()
@property (nonatomic, strong) UIImageView *headImage;
@end
@implementation SWMeHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    UIImageView *cover = [[UIImageView alloc]init];
    cover.image = [UIImage imageNamed:@"me_header_cover_375x35_"];
    [self addSubview:cover];
    [cover mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(-55);
        make.left.right.equalTo(@0);
        make.height.equalTo(@35);
    }];
    
    UIView *container = [[UIView alloc]init];
    container.backgroundColor = [UIColor whiteColor];
    [self addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@56);
    }];
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(container.mas_top);
        make.width.height.equalTo(@80);
        make.left.equalTo(@20);
    }];
    self.headImage.layer.cornerRadius = 40;
    self.headImage.layer.borderColor = [UIColor whiteColor].CGColor;
    self.headImage.layer.borderWidth = 2.0f;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:[SWUserManager shareManager].avatar] placeholderImage:[UIImage imageNamed:SWUserAvatar]];
}

- (UIImageView *)headImage {
    if (!_headImage) {
        _headImage = [[UIImageView alloc]init];
        _headImage.clipsToBounds = YES;
        _headImage.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_headImage];
    }
    return _headImage;
}


@end
