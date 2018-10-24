//
//  SWTimeLineMusicView.m
//  SWDYD
//
//  Created by zijin on 2018/10/18.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWTimeLineMusicView.h"
#import "SWTimeLineLayout.h"
#import "SWTimeLineModel.h"

@interface SWTimeLineMusicView()
@property (nonatomic, strong) UIImageView *albumImage;
@property (nonatomic, strong) UILabel *musicLab;
@property (nonatomic, strong) UILabel *singerLab;
@end
@implementation SWTimeLineMusicView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setMusic:(SWTimeLineMusic *)music {
    _music = music;
    [self.albumImage sd_setImageWithURL:[NSURL URLWithString:_music.musicImageUrl] placeholderImage:[UIImage imageNamed:kSWLoadeedImage]];
    self.musicLab.text = _music.musicName;
    self.singerLab.text = _music.musicSingers.firstObject;
}

- (void)setup {
    UIImageView *bgImage = [[UIImageView alloc]init];
    bgImage.image = [UIImage imageNamed:@"music_cell_back_347x101_"];
    [self addSubview:bgImage];
    [bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(@0);
    }];
    
    [self.albumImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.width.height.equalTo(@60);
        make.centerY.equalTo(@0);
    }];
    
    [self.singerLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-15));
        make.top.equalTo(self.albumImage);
    }];
    
    [self.musicLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.albumImage.mas_right).offset(15);
        make.right.equalTo(self.singerLab.mas_left).offset(-15);
        make.top.equalTo(self.albumImage);
    }];
}

- (UIImageView *)albumImage {
    if (!_albumImage) {
        _albumImage = [[UIImageView alloc]init];
        _albumImage.clipsToBounds = YES;
        _albumImage.contentMode = UIViewContentModeScaleAspectFill;
        _albumImage.layer.cornerRadius = 5;
        [self addSubview:_albumImage];
    }
    return _albumImage;
}

- (UILabel *)musicLab {
    if (!_musicLab) {
        _musicLab = [[UILabel alloc]init];
        _musicLab.textColor = [UIColor whiteColor];
        _musicLab.textAlignment = NSTextAlignmentLeft;
        _musicLab.font = SWFont(14);
        [self addSubview:_musicLab];
    }
    return _musicLab;
}

- (UILabel *)singerLab {
    if (!_singerLab) {
        _singerLab = [[UILabel alloc]init];
        _singerLab.textColor = [UIColor whiteColor];
        _singerLab.textAlignment = NSTextAlignmentRight;
        _singerLab.font = SWFont(14);
        [self addSubview:_singerLab];
    }
    return _singerLab;
}

@end
