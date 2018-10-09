//
//  SWMeHeaderView.m
//  SWDYD
//
//  Created by zijin on 2018/9/30.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWMeHeaderView.h"
#import "SWMeModel.h"

@interface SWMeHeaderView()
@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UILabel *nickNameLab;
@end
@implementation SWMeHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setUser:(SWMeUser *)user {
    _user = user;
    
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", SWImageBaseURL, _user.avatar]] placeholderImage:[UIImage imageNamed:SWUserAvatar]];
    self.nickNameLab.text = _user.nickName;
    
    // 粉丝数
    UILabel *followerCountLab = [self viewWithTag:100];
    followerCountLab.text = [NSString stringWithFormat:@"粉丝 %ld", (long)_user.userFollowerCount];
    // 关注数
    UILabel *followingCountLab = [self viewWithTag:101];
    followingCountLab.text = [NSString stringWithFormat:@"粉丝 %ld", (long)_user.userFollowingCount];
    // 糖果数
    UILabel *likeCountLab = [self viewWithTag:102];
    likeCountLab.text = [NSString stringWithFormat:@"糖果 %ld", (long)_user.userPostIsLikedCount];
}

- (void)setup {
    UIImageView *cover = [[UIImageView alloc]init];
    cover.image = [UIImage imageNamed:@"me_header_cover_375x35_"];
    [self addSubview:cover];
    [cover mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(-50);
        make.left.right.equalTo(@0);
        make.height.equalTo(@40);
    }];
    
    UIView *container = [[UIView alloc]init];
    container.backgroundColor = [UIColor whiteColor];
    [self addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@51);
    }];
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(container.mas_top);
        make.width.height.equalTo(@80);
        make.left.equalTo(@20);
    }];
    self.headImage.layer.cornerRadius = 40;
    self.headImage.layer.borderColor = [UIColor whiteColor].CGColor;
    self.headImage.layer.borderWidth = 2.0f;
    
    [self.nickNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImage.mas_right).offset(15);
        make.bottom.equalTo(cover.mas_top);
    }];
    
    NSMutableArray *masArray = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        UILabel *tempLab = [[UILabel alloc]init];
        tempLab.font = SWFont(14);
        tempLab.textColor = [UIColor sw_black];
        tempLab.textAlignment = NSTextAlignmentCenter;
        tempLab.tag = 100 + i;
        [container addSubview:tempLab];
        [masArray addObject:tempLab];
    }
    [masArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:5 leadSpacing:5 tailSpacing:5];
    [masArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
    }];
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

- (UILabel *)nickNameLab {
    if (!_nickNameLab) {
        _nickNameLab = [[UILabel alloc]init];
        _nickNameLab.font = SWBoldFont(18);
        _nickNameLab.textColor = [UIColor whiteColor];
        [self addSubview:_nickNameLab];
    }
    return _nickNameLab;
}

@end
