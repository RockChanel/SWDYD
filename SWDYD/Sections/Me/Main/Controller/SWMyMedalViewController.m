//
//  SWMyMedalViewController.m
//  SWDYD
//
//  Created by zijin on 2018/9/29.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWMyMedalViewController.h"
#import "UIViewController+Ext.h"
#import "SWMedalHeaderView.h"
#import "SWMedalModel.h"
#import "SWMedalSectionHeader.h"
#import "SWMedalCell.h"

@interface SWMyMedalViewController ()<UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong) UIBarButtonItem *backItem;
@property(nonatomic, strong) UIBarButtonItem *shareItem;
@property(nonatomic, assign) BOOL isTransparent;
@property (nonatomic, strong) SWMedalList *list;
@property (nonatomic, strong) SWMedalHeaderView *medalHeader;
@end

@implementation SWMyMedalViewController

static CGFloat const ItemWidth = 100.0f;
static CGFloat const ItemHeight = 140.0f;
static CGFloat const EdgeMargin = 15.0f;
static NSInteger const RowCount = 3;
static CGFloat const HeaderImageHeight = 302.0f;
static NSString * const medalCellId = @"medalCellId";
static NSString * const headerId = @"headerId";

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.backItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:SWBackItem_White] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = _backItem;
    
    self.shareItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"navi_bar_share_img_30x30_"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:@selector(shareAction)];
    self.navigationItem.rightBarButtonItem = _shareItem;
    
    self.collectionView.contentInset = UIEdgeInsetsMake(HeaderImageHeight, 0, 0, 0);
    [self.collectionView registerClass:[SWMedalSectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    [self.collectionView registerClass:[SWMedalCell class] forCellWithReuseIdentifier:medalCellId];
    
    self.medalHeader = [[SWMedalHeaderView alloc]initWithFrame:CGRectMake(0, -HeaderImageHeight, self.view.mj_w, HeaderImageHeight)];
    [self.collectionView addSubview:_medalHeader];
    
    self.isTransparent = YES;
    [self loadData];
}

- (void)loadData {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"appChannel"] = @"ios";
    params[@"userId"] = [SWUserManager shareManager].user.userId;
    params[@"isUpgrade"] = @"true";
    params[@"versionName"] = @"20180921";
    
    [[SWNetworkManager shareManager] requestWithMethod:SWHttpMethodGet api:SWMe_MedalList parameters:params success:^(SWJsonModel * _Nullable json) {
        self.list = [SWMedalList getShowMedalsWithList:[SWMedalList yy_modelWithJSON:json.data]];
        self.medalHeader.avatar = self.list.userInfo.avatar;
        self.medalHeader.medalCount = self.list.medalCount;
        self.medalHeader.nickName = self.list.userInfo.nickName;
        [self.collectionView reloadData];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)shareAction {
    NSLog(@"分享======");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat currentOffsetY = self.collectionView.contentOffset.y;
    CGFloat keyOffsetY = - (SWStatusBarHeight + SWNavigationBarHeight);
    self.isTransparent = currentOffsetY < keyOffsetY;
}

- (void)setIsTransparent:(BOOL)isTransparent {
    _isTransparent = isTransparent;
    [self sw_setNavBarTransparent:isTransparent];
    self.title = isTransparent ? @"":@"我的勋章墙";
    [self.backItem setImage:[[UIImage imageNamed: isTransparent ? SWBackItem_White:SWBackItem_Red] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self.shareItem setImage:[[UIImage imageNamed: isTransparent ? @"navi_bar_share_img_30x30_":@"share_red_30x30_"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _list.allMedalList.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _list.allMedalList[section].medalList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SWMedalCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:medalCellId forIndexPath:indexPath];
    cell.medal = _list.allMedalList[indexPath.section].medalList[indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        SWMedalSectionHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerId forIndexPath:indexPath];
        header.sectionTitle = _list.allMedalList[indexPath.section].name;
        return header;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(ItemWidth, ItemHeight);
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

- (UIStatusBarStyle)preferredStatusBarStyle {
    return _isTransparent ? UIStatusBarStyleLightContent:UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
