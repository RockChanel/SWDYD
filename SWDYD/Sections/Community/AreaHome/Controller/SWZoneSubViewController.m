//
//  SWZoneSubViewController.m
//  SWDYD
//
//  Created by zijin on 2018/10/18.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWZoneSubViewController.h"
#import "SWTimeLineCell.h"
#import "SWTopTimeLineCell.h"
#import "SWZoneHomeModel.h"
#import "SWTimeLineModel.h"
#import "SWTimeLineLayout.h"

@interface SWZoneSubViewController ()
@property (nonatomic, strong) SWTimeLineModel *timeLine;
@property (nonatomic, strong) NSMutableArray *layouts;
@end

@implementation SWZoneSubViewController

static NSString *cellId = @"cellId";
static NSString *topCellId = @"topCellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.tableView.estimatedRowHeight = 100;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[SWTimeLineCell class] forCellReuseIdentifier:cellId];
    [self.tableView registerClass:[SWTopTimeLineCell class] forCellReuseIdentifier:topCellId];
    
    self.perPage = 20;
    [self loadData:YES];
}

- (void)loadData:(BOOL)isRefresh {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"appChannel"] = kSWAppChannel;
    params[@"isUpgrade"] = kSWIsUpgrade;
    params[@"versionName"] = kSWVersionName;
    params[@"page"] = @(self.page);
    params[@"perPage"] = @(self.perPage);
    params[@"CateId"] = _category.categoryId;
    params[@"subAreaName"] = _category.categoryName;
    
    [[SWNetworkManager shareManager] requestWithMethod:SWHttpMethodGet api:kSWApiHotZoneDetail parameters:params success:^(SWJsonModel * _Nullable json) {
        self.timeLine = [SWTimeLineModel yy_modelWithJSON:json.data];
        [self.timeLine.postList enumerateObjectsUsingBlock:^(SWTimeLineItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            SWTimeLineLayout *layout = [[SWTimeLineLayout alloc]initWithItem:obj style:SWLayoutStyleTimeline];
            [self.layouts addObject:layout];
        }];
        [self.tableView reloadData];
    } failure:nil];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _timeLine.topPostList.count;
    }
    return self.layouts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        SWTopTimeLineCell *cell = [tableView dequeueReusableCellWithIdentifier:topCellId forIndexPath:indexPath];
        cell.item = _timeLine.topPostList[indexPath.row];
        return cell;
    }
    SWTimeLineCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.layout = self.layouts[indexPath.row];
    return cell;
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
