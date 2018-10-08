//
//  SWFollowViewController.m
//  SWDYD
//
//  Created by zijin on 2018/9/28.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWFollowViewController.h"
#import "SWFollowUserCell.h"
#import "SWFollowAreaCell.h"
#import "SWFollowModel.h"
#import "SWFollowHeaderView.h"
#import "SWFollowFooterView.h"

@interface SWFollowViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray<SWFollowUser *> *userList;
@property (nonatomic, strong) NSArray<SWFollowArea *> *areaList;
@end

@implementation SWFollowViewController

static CGFloat const UserItemWidth = 90.0;
static CGFloat const AreaItemWidth = 110.0;
static CGFloat const EdgeMargin = 10.0;
static NSString * const userCellId = @"userCellId";
static NSString * const areaCellId = @"areaCellId";
static NSString * const headerId = @"headerId";
static NSString * const footerId = @"footerId";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.collectionView registerClass:[SWFollowUserCell class] forCellWithReuseIdentifier:userCellId];
    [self.collectionView registerClass:[SWFollowAreaCell class] forCellWithReuseIdentifier:areaCellId];
    [self.collectionView registerClass:[SWFollowHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    [self.collectionView registerClass:[SWFollowFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerId];
    
    self.showRefreshHeader = YES;
    [self autoHeaderRefresh:NO];
}

#pragma mark -- 加载数据
- (void)headerRefresh {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"appChannel"] = SWAppChannel;
    params[@"index"] = @"0";
    params[@"isUpgrade"] = SWIsUpgrade;
    params[@"page"] = [NSNumber numberWithInt:1];
    params[@"perPage"] = [NSNumber numberWithInt:50];
    params[@"queryType"] = @"myConcern";
    params[@"versionName"] = SWVersionName;
    
    [self.collectionView.mj_header endRefreshing];
    [[SWNetworkManager shareManager] requestWithMethod:SWHttpMethodGet api:SWAPI_FollowList parameters:params success:^(SWJsonModel * _Nullable json) {
        SWFollowModel *model = [SWFollowModel yy_modelWithJSON:json.data];
        self.userList = model.recommendPageUserList;
        self.areaList = model.recommendSubAreaList;
        [self endRefreshHeader:YES reload:YES];
    } failure:^(NSError * _Nonnull error) {
        [self endRefreshHeader:YES reload:NO];
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (0 == section) {
        return _userList.count > RecommandMaxCount ? RecommandMaxCount:_userList.count;
    }
    return _areaList.count > RecommandMaxCount ? RecommandMaxCount:_areaList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        SWFollowUserCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:userCellId forIndexPath:indexPath];
        cell.user = _userList[indexPath.item];
        return cell;
    }
    SWFollowAreaCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:areaCellId forIndexPath:indexPath];
    cell.area = _areaList[indexPath.item];
    return cell;
}

- (NSArray<SWFollowUser *> *)userList {
    if (!_userList) {
        _userList = [NSArray array];
    }
    return _userList;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        SWFollowHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerId forIndexPath:indexPath];
        header.iconName = 0 == indexPath.section ? @"interestFriend_22x22_":@"interestArea_22x22_";
        header.title = [NSString stringWithFormat:@"你可能感兴趣的%@", 0 == indexPath.section ? @"弹友":@"专区"];
        return header;
    }
    else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        SWWeakSelf
        SWFollowFooterView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerId forIndexPath:indexPath];
        footer.isUser = 0 == indexPath.section;
        footer.refreshCompletion = ^(NSArray * _Nullable models) {
            if (0 == indexPath.section) {
                weakSelf.userList = models;
            }
            else {
                weakSelf.areaList = models;
            }
            [weakSelf.collectionView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]];
        };
        return footer;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return 0 == indexPath.section ? CGSizeMake(UserItemWidth, 150):CGSizeMake(AreaItemWidth, 180);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(15, EdgeMargin, 15, EdgeMargin);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.view.mj_w, 47);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(self.view.mj_w, 40);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    CGFloat itemWidth = 0 == section ? UserItemWidth:AreaItemWidth;
    return (self.view.mj_w - RecommandMaxCount*itemWidth - 2*EdgeMargin)/(RecommandMaxCount-1);
}

- (NSArray<SWFollowArea *> *)areaList {
    if (!_areaList) {
        _areaList = [NSArray array];
    }
    return _areaList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
