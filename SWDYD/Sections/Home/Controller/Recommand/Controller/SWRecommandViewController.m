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
#import "SWTimeLineModel.h"
#import "SWTimeLineLayout.h"

@interface SWRecommandViewController ()<SWTimeLineCellDelegate>
@property (nonatomic, strong) NSMutableArray *layouts;
@property (nonatomic, strong) SWRecommandBannerView *banner;
@end

@implementation SWRecommandViewController

static NSString *cellId = @"cellId";

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100.0f;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableHeaderView = self.banner;
    
    self.showRefreshHeader = YES;
    self.showRefreshFooter = YES;
    [self autoHeaderRefresh:NO];
    
    [self loadBanner];
}

- (void)loadData:(BOOL)isRefresh {
    if (isRefresh) {
        self.page = 1;
        [self.layouts removeAllObjects];
    }
    else {
        self.page += 1;
    }
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"appChannel"] = kSWAppChannel;
    params[@"isUpgrade"] = kSWIsUpgrade;
    params[@"versionName"] = kSWVersionName;
    params[@"page"] = @(self.page);
    params[@"page_size"] = @(self.perPage);
    params[@"queryType"] = @"mainPage";
    
    [[SWNetworkManager shareManager] requestWithMethod:SWHttpMethodGet api:kSWApiRecommandPostList parameters:params success:^(SWJsonModel * _Nullable json) {
        SWTimeLineModel *list = [SWTimeLineModel yy_modelWithJSON:json.data];
        [list.postList enumerateObjectsUsingBlock:^(SWTimeLineItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            SWTimeLineLayout *layout = [[SWTimeLineLayout alloc]initWithItem:obj style:SWLayoutStyleTimeline];
            [self.layouts addObject:layout];
        }];
        [self endRefreshHeader:isRefresh reload:YES];
    } failure:^(NSError * _Nonnull error) {
        [self endRefreshHeader:isRefresh reload:NO];
    }];
}

- (void)loadBanner {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"appChannel"] = kSWAppChannel;
    params[@"isUpgrade"] = kSWIsUpgrade;
    params[@"versionName"] = kSWVersionName;
    
    [[SWNetworkManager shareManager] requestWithMethod:SWHttpMethodGet api:kSWApiRecommandBanner parameters:params success:^(SWJsonModel * _Nullable json) {
        SWRecommandBannerList *tempList = [SWRecommandBannerList yy_modelWithJSON:json.data];
        self.banner.list = tempList;
    } failure:nil];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.layouts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SWTimeLineCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SWTimeLineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.delegate = self;
    }
    cell.layout = self.layouts[indexPath.row];
    return cell;
}

- (SWRecommandBannerView *)banner {
    if (!_banner) {
        _banner = [[SWRecommandBannerView alloc]initWithFrame:CGRectMake(0, 0, self.view.mj_w, 235)];
    }
    return _banner;
}

- (NSMutableArray *)layouts {
    if (!_layouts) {
        _layouts = [NSMutableArray array];
    }
    return _layouts;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
