//
//  SWTimeLineMusicView.m
//  SWDYD
//
//  Created by zijin on 2018/10/18.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWTimeLineMusicView.h"
#import "SWTimeLineLayout.h"

@interface SWTimeLineMusicView()

@end
@implementation SWTimeLineMusicView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    UIImageView *bgImage = [[UIImageView alloc]init];
    bgImage.image = [UIImage imageNamed:@"music_cell_back_347x101_"];
    [self addSubview:bgImage];
    [bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(kSWTimeLinePadding));
        make.top.bottom.equalTo(@0);
        make.right.equalTo(@(-kSWTimeLinePadding));
    }];
}

@end
