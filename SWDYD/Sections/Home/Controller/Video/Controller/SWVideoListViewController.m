//
//  SWVideoListViewController.m
//  SWDYD
//
//  Created by zijin on 2018/10/22.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWVideoListViewController.h"
#import "SWVideoListCell.h"
#import "SWVideoListModel.h"

@interface SWVideoListViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSMutableArray *datas;
@end

@implementation SWVideoListViewController

static NSString * const cellId = @"cellId";
static CGFloat const edgeMargin = 10;
static CGFloat const itemPadding = 15;
static NSInteger const rowCount = 2;

- (NSMutableArray *)datas {
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[SWVideoListCell class] forCellWithReuseIdentifier:cellId];
    
    self.showRefreshHeader = YES;
    self.showRefreshFooter = YES;
    [self autoHeaderRefresh:NO];
    self.perPage = 20;
}

- (void)loadData:(BOOL)isRefresh {
    if (isRefresh) {
        self.page = 1;
        [self.datas removeAllObjects];
    }
    else {
        self.page += 1;
    }
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"appChannel"] = kSWAppChannel;
    params[@"isUpgrade"] = kSWIsUpgrade;
    params[@"versionName"] = kSWVersionName;
    params[@"page"] = @(self.page);
    params[@"perPage"] = @(self.perPage);
    
    [[SWNetworkManager shareManager] requestWithMethod:SWHttpMethodGet api:kSWApiShortvideoList parameters:params success:^(SWJsonModel * _Nullable json) {
        SWVideoListModel *videoList = [SWVideoListModel yy_modelWithJSON:json.data];
        if (videoList.shortVideoPostList) {
            [self.datas addObjectsFromArray:videoList.shortVideoPostList];
        }
        [self endRefreshHeader:isRefresh reload:YES];
    } failure:^(NSError * _Nonnull error) {
        [self endRefreshHeader:isRefresh reload:NO];
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SWVideo *video = self.datas[indexPath.item];
    SWVideoListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.video = video;
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(edgeMargin, edgeMargin, edgeMargin, edgeMargin);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return itemPadding;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return itemPadding;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat itemWidth = (self.collectionView.mj_w - (rowCount-1)*itemPadding - 2*edgeMargin)/2;
    return CGSizeMake(itemWidth, 220);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
