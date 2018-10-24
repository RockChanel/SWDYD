//
//  SWVideoListCell.m
//  SWDYD
//
//  Created by zijin on 2018/10/22.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWVideoListCell.h"
#import "SWVideoListModel.h"
#import "SWTimeLineHelper.h"

@interface SWVideoListCell()
@property (nonatomic, strong) UIImageView *coverImage;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *playCountLab;
@end
@implementation SWVideoListCell

- (void)setVideo:(SWVideo *)video {
    _video = video;
    [self.coverImage sd_setImageWithURL:[NSURL URLWithString:_video.postCoverImageList.firstObject] placeholderImage:[UIImage imageNamed:kSWLoadeedImage]];
    self.titleLab.text = _video.postTitle;
    self.playCountLab.text = [SWTimeLineHelper shortedNumberDesc:_video.postReadCount];
}

- (void)setup {
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 5;

    [self.coverImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(@0);
        make.bottom.equalTo(@(-55));
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.top.equalTo(self.coverImage.mas_bottom).offset(10);
    }];
    
    UIImageView *playIcon = [[UIImageView alloc]init];
    playIcon.image = [UIImage imageNamed:@"video_sideRecommend_playCount_20x20_"];
    [self.contentView addSubview:playIcon];
    [playIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(self.titleLab.mas_bottom).offset(10);
        make.width.height.equalTo(@20);
    }];
    
    [self.playCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(playIcon.mas_right).offset(5);
        make.right.equalTo(@0);
        make.centerY.equalTo(playIcon);
    }];
}

- (UIImageView *)coverImage {
    if (!_coverImage) {
        _coverImage = [[UIImageView alloc]init];
        _coverImage.clipsToBounds = YES;
        _coverImage.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_coverImage];
    }
    return _coverImage;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.textColor = [UIColor sw_black];
        _titleLab.font = SWBoldFont(13);
        [self.contentView addSubview:_titleLab];
    }
    return _titleLab;
}

- (UILabel *)playCountLab {
    if (!_playCountLab) {
        _playCountLab = [[UILabel alloc]init];
        _playCountLab.textColor = [UIColor sw_darkGray];
        _playCountLab.font = SWFont(11);
        [self.contentView addSubview:_playCountLab];
    }
    return _playCountLab;
}

@end
