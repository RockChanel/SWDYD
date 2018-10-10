//
//  SWRecommandViewController.m
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWRecommandViewController.h"
#import "SWRecommandBannerView.h"
#import "SWRecommandModel.h"
#import "SWTimeLineCell.h"

@interface SWRecommandViewController ()
@property (nonatomic, strong) SWRecommandBannerView *banner;
@end

@implementation SWRecommandViewController

static NSString *cellId = @"cellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 100;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableHeaderView = self.banner;
    [self.tableView registerClass:[SWTimeLineCell class] forCellReuseIdentifier:cellId];
    
    self.showRefreshHeader = YES;
    [self autoHeaderRefresh:NO];
    
    [self loadBanner];
}

- (void)headerRefresh {
    [self endRefreshHeader:YES reload:NO];
}

- (void)loadBanner {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"appChannel"] = SWAppChannel;
    params[@"isUpgrade"] = SWIsUpgrade;
    params[@"versionName"] = SWVersionName;
    
    [[SWNetworkManager shareManager] requestWithMethod:SWHttpMethodGet api:SWAPI_RecommandBanner parameters:params success:^(SWJsonModel * _Nullable json) {
        SWRecommandBannerList *tempList = [SWRecommandBannerList yy_modelWithJSON:json.data];
        self.banner.list = tempList;
    } failure:nil];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SWTimeLineCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    return cell;
}

- (SWRecommandBannerView *)banner {
    if (!_banner) {
        _banner = [[SWRecommandBannerView alloc]initWithFrame:CGRectMake(0, 0, self.view.mj_w, 160)];
    }
    return _banner;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
