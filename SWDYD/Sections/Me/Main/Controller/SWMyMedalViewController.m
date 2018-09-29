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

@interface SWMyMedalViewController ()<UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong) UIBarButtonItem *backItem;
@property(nonatomic, strong) UIBarButtonItem *shareItem;
@property(nonatomic, assign) BOOL isTransparent;
@end

@implementation SWMyMedalViewController

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
    
    self.shareItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"navi_bar_share_img_30x30_"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.rightBarButtonItem = _shareItem;
    
    [self.collectionView registerClass:[SWMedalHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:medalCellId];
    
    self.isTransparent = YES;
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat currentOffsetY = self.collectionView.contentOffset.y;
    CGFloat keyOffsetY = HeaderImageHeight - SWStatusBarHeight - SWNavigationBarHeight;
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
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:medalCellId forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        SWMedalHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerId forIndexPath:indexPath];
        return header;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.view.mj_w, HeaderImageHeight);
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return _isTransparent ? UIStatusBarStyleLightContent:UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
