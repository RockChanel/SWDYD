//
//  SWHotSubViewController.m
//  SWDYD
//
//  Created by selwyn on 2018/10/1.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWHotSubViewController.h"
#import "SWHotCategoryCell.h"
#import "SWHotZoneModel.h"
#import "SWHotCategoryHeaderView.h"
#import "SWZoneHomeViewController.h"

@interface SWHotSubViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) SWHotZoneModel *hotZone;
@end

@implementation SWHotSubViewController

static CGFloat const ItemWidth = 110.0;
static CGFloat const ItemHeight = 110.0;
static CGFloat const EdgeMargin = 10.0;
static NSInteger const RowCount = 3;
static NSString * const cellId = @"cellId";
static NSString * const headerId = @"headerId";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[SWHotCategoryCell class] forCellWithReuseIdentifier:cellId];
    [self.collectionView registerClass:[SWHotCategoryHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    
    self.showRefreshHeader = YES;
    [self autoHeaderRefresh:NO];
}

- (void)headerRefresh {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"appChannel"] = @"ios";
    params[@"index"] = @"0";
    params[@"isUpgrade"] = @"true";
    params[@"page"] = [NSNumber numberWithInt:1];
    params[@"perPage"] = [NSNumber numberWithInt:20];
    params[@"selectedFirstLevelCategory"] = _category;
    params[@"versionName"] = @"20180921";
    
    [[SWNetworkManager shareManager] requestWithMethod:SWHttpMethodGet api:SWCommunity_HotZone parameters:params success:^(SWJsonModel * _Nullable json) {
        self.hotZone = [SWHotZoneModel yy_modelWithJSON:json.data];
        [self endRefreshHeader:YES reload:YES];
    } failure:^(NSError * _Nonnull error) {
        [self endRefreshHeader:YES reload:NO];
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _hotZone.categoryInfoList.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _hotZone.categoryInfoList[section].list.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SWHotCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.info = _hotZone.categoryInfoList[indexPath.section].list[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SWZoneHomeViewController *zoneHomeVC = [[SWZoneHomeViewController alloc]init];
    zoneHomeVC.title = _hotZone.categoryInfoList[indexPath.section].list[indexPath.row].areaName;
    [self.navigationController pushViewController:zoneHomeVC animated:YES];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        SWHotCategoryHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerId forIndexPath:indexPath];
        header.category = _hotZone.categoryInfoList[indexPath.section].category;
        return header;
    }
    return nil;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, EdgeMargin, 0, EdgeMargin);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.view.mj_w, 40);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return (self.view.mj_w - RowCount*ItemWidth - 2*EdgeMargin)/(RowCount - 1);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(ItemWidth, ItemHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
