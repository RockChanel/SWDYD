//
//  SWFollowFooterView.m
//  SWDYD
//
//  Created by zijin on 2018/9/28.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWFollowFooterView.h"
#import "SWFollowModel.h"

@interface SWFollowFooterView()
@property (nonatomic, strong) UIImageView *refreshIcon;
@property (nonatomic, assign) BOOL isAnimation;
@end
@implementation SWFollowFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)updateAction {
    if (!_refreshCompletion) {
        return;
    }
    [self startAnimation];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"appChannel"] = kSWAppChannel;
    params[@"isUpgrade"] = kSWIsUpgrade;
    params[@"count"] = [NSNumber numberWithInteger:RecommandMaxCount];
    params[@"callType"] = _isUser ? @"102":@"103";
    
    [[SWNetworkManager shareManager] requestWithMethod:SWHttpMethodGet api:kSWApiFollowRecommend parameters:params success:^(SWJsonModel * _Nullable json) {
        SWFollowModel *model = [SWFollowModel yy_modelWithJSON:json.data];
        NSArray *tempArray = self.isUser ? model.recommendPageUserList:model.recommendSubAreaList;
        self.refreshCompletion(tempArray);
        [self endAnimation];
    } failure:^(NSError * _Nonnull error) {
        self.refreshCompletion(nil);
        [self endAnimation];
    }];
}

#pragma mark -- 会出现跳转页面或进入后台等情况导致动画停止
- (void)startAnimation {
    if (_isAnimation) {
        [self endAnimation];
    }
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue = [NSNumber numberWithFloat:M_PI *2];
    animation.duration = 0.5;
    animation.autoreverses = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = MAXFLOAT; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    [self.refreshIcon.layer addAnimation:animation forKey:nil];
    self.isAnimation = YES;
}

- (void)endAnimation {
    [self.refreshIcon.layer removeAllAnimations];
    self.isAnimation = NO;
}

- (void)setup {
    UIView *container = [[UIView alloc]init];
    [self addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.centerX.equalTo(@0);
        make.leading.greaterThanOrEqualTo(self);
        make.trailing.lessThanOrEqualTo(self);
    }];
    
    UILabel *tipLab = [[UILabel alloc]init];
    tipLab.font = SWFont(13);
    tipLab.text = @"换一批";
    tipLab.textColor = [UIColor sw_red];
    [container addSubview:tipLab];
    [container addSubview:self.refreshIcon];
    
    [tipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.equalTo(@0);
        make.height.equalTo(self.refreshIcon);
    }];
    
    [self.refreshIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.centerY.equalTo(@0);
        make.left.equalTo(tipLab.mas_right).offset(10);
    }];
    
    UIButton *updateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [updateBtn addTarget:self action:@selector(updateAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:updateBtn];
    [updateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(container);
    }];
}

- (UIImageView *)refreshIcon {
    if (!_refreshIcon) {
        _refreshIcon = [[UIImageView alloc]init];
        _refreshIcon.image = [UIImage imageNamed:@"search_huanyipi_red_15x15_"];
    }
    return _refreshIcon;
}

@end
