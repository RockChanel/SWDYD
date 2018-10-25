//
//  SWTimeLineActionView.m
//  SWDYD
//
//  Created by zijin on 2018/10/10.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWTimeLineActionView.h"
#import "SWTimeLineLayout.h"
#import "SWTimeLineModel.h"
#import "SWTimeLineHelper.h"
#import "SWTimeLineCell.h"

@interface SWTimeLineActionView()
/** 收藏按钮 */
@property (nonatomic, strong) UIButton *collectBtn;
/** 收藏图标 */
@property (nonatomic, strong) UIImageView *collectIcon;
@property (nonatomic, strong) UILabel *collectLab;
/** 送糖按钮 */
@property (nonatomic, strong) UIButton *likeBtn;
/** 送糖图标 */
@property (nonatomic, strong) UIImageView *likeIcon;
@property (nonatomic, strong) UILabel *likeLab;
/** 评论按钮 */
@property (nonatomic, strong) UIButton *commentBtn;
/** 评论图标 */
@property (nonatomic, strong) UIImageView *commentIcon;
@property (nonatomic, strong) UILabel *commentLab;

@end
@implementation SWTimeLineActionView

static NSString * const collectNormal = @"star_collect_gray";   // 未收藏
static NSString * const collectLight = @"star_collect_yellow";  // 已收藏
static NSString * const likeNormal = @"candy_like_gray";    // 未送糖
static NSString * const likeLight = @"candy_like_red";      // 已送糖

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setLayout:(SWTimeLineLayout *)layout {
    _layout = layout;
    self.collectLab.text = [SWTimeLineHelper shortedNumberDesc:_layout.item.postCollectCount];
    self.commentLab.text = [SWTimeLineHelper shortedNumberDesc:_layout.item.postCommentCount];
    self.likeLab.text = [SWTimeLineHelper shortedNumberDesc:_layout.item.postLikeCount];
    self.collectIcon.image = [UIImage imageNamed:_layout.item.postIsCollect ? collectLight:collectNormal];
    self.likeIcon.image = [UIImage imageNamed:_layout.item.postIsLike ? likeLight:likeNormal];
}

#pragma mark -- 收藏按钮点击事件
- (void)collectAction {
    if ([self.cell.delegate respondsToSelector:@selector(cellDidClickCollect:)]) {
        [self.cell.delegate cellDidClickCollect:self.cell];
    }
    else {
        if (_layout.item.postIsCollect) {
            [self collectDelete];
        }
        else {
            [self collectAdd];
        }
    }
}

#pragma mark -- 添加收藏
- (void)collectAdd {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"appChannel"] = kSWAppChannel;
    params[@"isUpgrade"] = kSWIsUpgrade;
    params[@"versionName"] = kSWVersionName;
    params[@"albumIds"] = kSWAlbumId;
    params[@"postId"] = _layout.item.postId;
    params[@"type"] = @"205";
    
    [[SWNetworkManager shareManager]requestWithMethod:SWHttpMethodPut api:kSWApiPostAlbum parameters:params success:^(SWJsonModel * _Nullable json) {
        if (json.code == kSWResponseCodeSuccess) {
            [SWProgressHUD sw_showTip:@"收藏成功＼（＾▽＾）／"];
            self.layout.item.postIsCollect = YES;
            self.layout.item.postCollectCount ++;
            self.collectLab.text = [SWTimeLineHelper shortedNumberDesc:self.layout.item.postCollectCount];
            self.collectIcon.image = [UIImage imageNamed:collectLight];
            [self updateAnimationWithIcon:self.collectIcon];
        }
    } failure:nil];
}

#pragma mark -- 取消收藏
- (void)collectDelete {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"appChannel"] = kSWAppChannel;
    params[@"isUpgrade"] = kSWIsUpgrade;
    params[@"versionName"] = kSWVersionName;
    params[@"postId"] = _layout.item.postId;
    
    [[SWNetworkManager shareManager] requestWithMethod:SWHttpMethodDelete api:kSWApiPostCollect parameters:params success:^(SWJsonModel * _Nullable json) {
        if (json.code == kSWResponseCodeSuccess) {
            self.layout.item.postIsCollect = NO;
            self.layout.item.postCollectCount --;
            self.collectLab.text = [SWTimeLineHelper shortedNumberDesc:self.layout.item.postCollectCount];
            self.collectIcon.image = [UIImage imageNamed:collectNormal];
        }
    } failure:nil];
}

#pragma mark -- 送糖按钮点击事件
- (void)likeAction {
    if ([self.cell.delegate respondsToSelector:@selector(cellDidClickLike:)]) {
        [self.cell.delegate cellDidClickLike:self.cell];
    }
    else {
        if (_layout.item.postIsLike) {
            [self likeDelete];
        }
        else {
            [self likeAdd];
        }
    }
}

#pragma mark -- 添加送糖
- (void)likeAdd {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"appChannel"] = kSWAppChannel;
    params[@"isUpgrade"] = kSWIsUpgrade;
    params[@"versionName"] = kSWVersionName;
    params[@"postId"] = _layout.item.postId;
    
    [[SWNetworkManager shareManager] requestWithMethod:SWHttpMethodPost api:kSWApiPostLike parameters:params success:^(SWJsonModel * _Nullable json) {
        if (json.code == kSWResponseCodeSuccess) {
            [SWProgressHUD sw_showTip:@"多送糖，宜脱单"];
            self.layout.item.postIsLike = YES;
            self.layout.item.postLikeCount ++;
            self.likeLab.text = [SWTimeLineHelper shortedNumberDesc:self.layout.item.postLikeCount];
            self.likeIcon.image = [UIImage imageNamed:likeLight];
            [self updateAnimationWithIcon:self.likeIcon];
        }
    } failure:nil];
}

#pragma mark -- 取消送糖
- (void)likeDelete {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"appChannel"] = kSWAppChannel;
    params[@"isUpgrade"] = kSWIsUpgrade;
    params[@"versionName"] = kSWVersionName;
    params[@"postId"] = _layout.item.postId;
    
    [[SWNetworkManager shareManager] requestWithMethod:SWHttpMethodDelete api:kSWApiPostLike parameters:params success:^(SWJsonModel * _Nullable json) {
        if (json.code == kSWResponseCodeSuccess) {
            self.layout.item.postIsLike = NO;
            self.layout.item.postLikeCount --;
            self.likeLab.text = [SWTimeLineHelper shortedNumberDesc:self.layout.item.postLikeCount];
            self.likeIcon.image = [UIImage imageNamed:likeNormal];
        }
    } failure:nil];
}

- (void)updateAnimationWithIcon:(UIImageView *)icon {
    // 抖动动画
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.keyPath = @"transform.rotation";
    keyAnimation.values = @[@(-10 / 180.0 * M_PI),@(10 /180.0 * M_PI),@(-10/ 180.0 * M_PI),@(0 /180.0 * M_PI)];
    keyAnimation.removedOnCompletion = NO;
    keyAnimation.fillMode = kCAFillModeForwards;
    keyAnimation.duration = 0.2;
    keyAnimation.repeatCount = 4;
    [icon.layer addAnimation:keyAnimation forKey:@"kSWRotationAnimationKey"];
}

#pragma mark -- 评论按钮点击事件
- (void)commentAction {
    if ([self.cell.delegate respondsToSelector:@selector(cellDidClickComment:)]) {
        [self.cell.delegate cellDidClickComment:self.cell];
    }
}

- (void)setup {
    UIView *separator = [[UIView alloc]init];
    separator.backgroundColor = [UIColor sw_tableBg];
    [self addSubview:separator];
    [separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@(kSWTimeLinePadding));
        make.right.equalTo(@(-kSWTimeLinePadding));
        make.height.equalTo(@0.5);
    }];
    
    NSMutableArray *masContainers = [NSMutableArray array];
    
    UIView *collectContainer = [[UIView alloc]init];
    [self addSubview:collectContainer];
    [masContainers addObject:collectContainer];
    
    UIView *commentContainer = [[UIView alloc]init];
    [self addSubview:commentContainer];
    [masContainers addObject:commentContainer];
    
    UIView *likeContainer = [[UIView alloc]init];
    [self addSubview:likeContainer];
    [masContainers addObject:likeContainer];
    
    [masContainers mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [masContainers mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(@0);
    }];
    
    UIView *collectBgView = [[UIView alloc]init];
    [collectContainer addSubview:collectBgView];
    [collectBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.centerX.equalTo(@0);
        make.leading.greaterThanOrEqualTo(collectContainer);
        make.trailing.lessThanOrEqualTo(collectContainer);
    }];
    
    [collectBgView addSubview:self.collectIcon];
    [collectBgView addSubview:self.collectLab];
    [self.collectIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.equalTo(@0);
        make.width.height.equalTo(@(kSWTimeLineActionImageWidth));
    }];
    [self.collectLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.collectIcon.mas_right).offset(kSWTimeLineActionImagePaddingRight);
        make.right.equalTo(@0);
        make.centerY.equalTo(@0);
    }];
    
    UIView *commentBgView = [[UIView alloc]init];
    [commentContainer addSubview:commentBgView];
    [commentBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.centerX.equalTo(@0);
        make.leading.greaterThanOrEqualTo(commentContainer);
        make.trailing.lessThanOrEqualTo(commentContainer);
    }];
    
    [commentBgView addSubview:self.commentIcon];
    [commentBgView addSubview:self.commentLab];
    [self.commentIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.equalTo(@0);
        make.width.height.equalTo(@(kSWTimeLineActionImageWidth));
    }];
    [self.commentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.commentIcon.mas_right).offset(kSWTimeLineActionImagePaddingRight);
        make.right.equalTo(@0);
        make.centerY.equalTo(@0);
    }];
    
    
    UIView *likeBgView = [[UIView alloc]init];
    [likeContainer addSubview:likeBgView];
    [likeBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.centerX.equalTo(@0);
        make.leading.greaterThanOrEqualTo(likeContainer);
        make.trailing.lessThanOrEqualTo(likeContainer);
    }];
    
    [likeBgView addSubview:self.likeIcon];
    [likeBgView addSubview:self.likeLab];
    [self.likeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.equalTo(@0);
        make.width.height.equalTo(@(kSWTimeLineActionImageWidth));
    }];
    [self.likeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.likeIcon.mas_right).offset(kSWTimeLineActionImagePaddingRight);
        make.right.equalTo(@0);
        make.centerY.equalTo(@0);
    }];
    
    [collectContainer addSubview:self.collectBtn];
    [commentContainer addSubview:self.commentBtn];
    [likeContainer addSubview:self.likeBtn];
    [self.collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(@0);
    }];
    [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(@0);
    }];
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(@0);
    }];
}

- (UILabel *)likeLab {
    if (!_likeLab) {
        _likeLab = [[UILabel alloc]init];
        _likeLab.font = SWFont(13);
        _likeLab.textColor = [UIColor sw_darkGray];
        _likeLab.text = @"0";
    }
    return _likeLab;
}


- (UIButton *)likeBtn {
    if (!_likeBtn) {
        _likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_likeBtn addTarget:self action:@selector(likeAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _likeBtn;
}

- (UIImageView *)likeIcon {
    if (!_likeIcon) {
        _likeIcon = [[UIImageView alloc]init];
    }
    return _likeIcon;
}

- (UILabel *)commentLab {
    if (!_commentLab) {
        _commentLab = [[UILabel alloc]init];
        _commentLab.font = SWFont(13);
        _commentLab.textColor = [UIColor sw_darkGray];
        _commentLab.text = @"0";
    }
    return _commentLab;
}


- (UIButton *)commentBtn {
    if (!_commentBtn) {
        _commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commentBtn addTarget:self action:@selector(commentAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commentBtn;
}

- (UIImageView *)commentIcon {
    if (!_commentIcon) {
        _commentIcon = [[UIImageView alloc]init];
        _commentIcon.image = [UIImage imageNamed:@"comment"];
    }
    return _commentIcon;
}


- (UILabel *)collectLab {
    if (!_collectLab) {
        _collectLab = [[UILabel alloc]init];
        _collectLab.font = SWFont(13);
        _collectLab.textColor = [UIColor sw_darkGray];
        _collectLab.text = @"0";
    }
    return _collectLab;
}


- (UIButton *)collectBtn {
    if (!_collectBtn) {
        _collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_collectBtn addTarget:self action:@selector(collectAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _collectBtn;
}

- (UIImageView *)collectIcon {
    if (!_collectIcon) {
        _collectIcon = [[UIImageView alloc]init];
    }
    return _collectIcon;
}

@end
