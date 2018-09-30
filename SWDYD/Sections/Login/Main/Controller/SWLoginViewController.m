//
//  SWLoginViewController.m
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWLoginViewController.h"

@interface SWLoginViewController ()

@end

@implementation SWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self setup];
}

- (void)setup {
    UIImageView *bgImage = [[UIImageView alloc]init];
    bgImage.image = [UIImage imageNamed:@"login_activity_bgNew"];
    [self.view addSubview:bgImage];
    [bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(@0);
    }];
    
    UIImageView *logo = [[UIImageView alloc]init];
    logo.image = [UIImage imageNamed:@"login_decoration_220x98_"];
    [self.view addSubview:logo];
    
    UIView *container = [[UIView alloc]init];
    container.backgroundColor = [UIColor whiteColor];
    container.layer.cornerRadius = 5.0f;
    container.clipsToBounds = YES;
    [self.view addSubview:container];
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.width.equalTo(@285);
        make.height.equalTo(@135);
        make.top.equalTo(@215);
    }];
    
    
    
    [logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.bottom.equalTo(container.mas_top).offset(15);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
