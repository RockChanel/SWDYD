//
//  SWFollowViewController.m
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWFollowViewController.h"
#import "SWFollowModel.h"

@interface SWFollowViewController ()
@property (nonatomic, strong) NSArray<SWFollowUser *> *userList;
@property (nonatomic, strong) NSArray<SWFollowArea *> *areaList;
@end

@implementation SWFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

- (void)loadData {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"appChannel"] = @"ios";
    params[@"index"] = @"0";
    params[@"isUpgrade"] = @"true";
    params[@"page"] = [NSNumber numberWithInt:1];
    params[@"perPage"] = [NSNumber numberWithInt:50];
    params[@"queryType"] = @"myConcern";
    params[@"versionName"] = @"20180921";
    
    [[SWNetworkManager shareManager] requestWithMethod:SWHttpMethodGet api:SWFollow_List parameters:params success:^(SWModel * _Nullable json) {

    } failure:^(NSError * _Nonnull error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
