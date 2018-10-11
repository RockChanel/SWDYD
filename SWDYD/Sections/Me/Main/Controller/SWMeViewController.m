//
//  SWMeViewController.m
//  SWDYD
//
//  Created by zijin on 2018/9/28.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWMeViewController.h"
#import "SWSettingViewController.h"
#import "SWMeCell.h"
#import "SWMeModel.h"
#import "SWMyMedalViewController.h"
#import "UIViewController+Ext.h"
#import "SWMeHeaderView.h"

@interface SWMeViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray<SWMeModel *> *datas;
/** 头部图片 */
@property (nonatomic, strong) UIImageView *headerImage;
/** 头部毛玻璃效果 */
@property (nonatomic, strong) UIView *headerEffect;
@property (nonatomic, strong) SWMeHeaderView *headerContainer;
@end

@implementation SWMeViewController

static CGFloat const itemWidth = 60.0f;
static CGFloat const itemHeight = 85.0f;
static CGFloat const edgeMargin = 15.0f;
static CGFloat const headerImageHeight = 260.0f;
static CGFloat const headerHeight = 300.0f;
static NSInteger const rowCount = 4;
static NSString * const cellId = @"cellId";

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self sw_setNavBarTransparent:YES];
    [self loadUserProfile];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.datas = [SWMeModel sw_meHomeList];
    
    UIBarButtonItem *settingItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"user_but_setting_normal_30x30_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style: UIBarButtonItemStylePlain target:self action:@selector(settingAction)];
    self.navigationItem.rightBarButtonItem = settingItem;
    
    self.collectionView.contentInset = UIEdgeInsetsMake(headerHeight, 0, 0, 0);
    [self.collectionView registerClass:[SWMeCell class] forCellWithReuseIdentifier:cellId];
    
    [self.collectionView addSubview:[self headerView]];
}

- (void)loadUserProfile {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userId"] = [SWUserManager shareManager].user.userId;
    params[@"appChannel"] = kSWAppChannel;
    params[@"isUpgrade"] = kSWIsUpgrade;
    params[@"versionName"] = kSWVersionName;
    
    [[SWNetworkManager shareManager] requestWithMethod:SWHttpMethodGet api:kSWApiPersonalActivities parameters:params success:^(SWJsonModel * _Nullable json) {
        SWMeUser *user = [SWMeUser yy_modelWithJSON:json.data];
        self.headerContainer.user = user;
    } failure:nil];
}

- (void)settingAction {
    SWSettingViewController *settingVC = [[SWSettingViewController alloc]initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = self.collectionView.contentOffset.y;
    if (offsetY < -headerImageHeight) {
        /* 计算差值 **/
        CGFloat interval = -CGRectGetHeight(self.headerImage.frame) - offsetY;
        /* imageView 的高度 增加 interval **/
        CGFloat imageViewH = CGRectGetHeight(self.headerImage.frame) + interval;
        /* 计算 imageView的 高度增加后的，宽度增加后的值  **/
        CGFloat imageViewW = imageViewH*CGRectGetWidth(self.headerImage.frame)/CGRectGetHeight(self.headerImage.frame);
        /* 计算 imageView X 的偏移量 **/
        CGFloat imageViewX =self.headerImage.frame.origin.x - (imageViewW -CGRectGetWidth(self.headerImage.frame))/2;
        /* 计算 imageView Y 的偏移量 **/
        CGFloat imageViewY =self.headerImage.frame.origin.y - interval;
        self.headerImage.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
        self.headerEffect.frame = _headerImage.frame;
    }
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SWMeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.model = _datas[indexPath.item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(itemWidth, itemHeight);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(edgeMargin, edgeMargin, edgeMargin, edgeMargin);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *tempVC = nil;
    switch (indexPath.item) {
        case 0:
        {
            //tempVC = [[SWMyHomeViewController alloc]init];
        }
            break;
        case 1:
        {
            UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
            tempVC =  [[SWMyMedalViewController alloc]initWithCollectionViewLayout:flowLayout];
        }
            break;
        default:
            break;
    }
    if (tempVC) {
        [self.navigationController pushViewController:tempVC animated:YES];
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return (self.view.mj_w - rowCount*itemWidth - 2*edgeMargin)/(rowCount - 1);
}

- (UIView *)headerView {
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, -headerHeight, self.view.mj_w, headerHeight)];
    
    self.headerImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.mj_w, headerImageHeight)];
    self.headerImage.image = [UIImage imageNamed:@"me_fragment_bg"];
    self.headerImage.clipsToBounds = YES;
    self.headerImage.contentMode = UIViewContentModeScaleAspectFill;
    [header addSubview:_headerImage];
    
    self.headerEffect = [[UIView alloc]init];
    self.headerEffect.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    self.headerEffect.frame = _headerImage.frame;
    [header addSubview:_headerEffect];
    
    UIView *separator = [[UIView alloc]init];
    separator.backgroundColor = [UIColor sw_tableBg];
    [header addSubview:separator];
    [separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@10);
    }];
    
    self.headerContainer = [[SWMeHeaderView alloc]init];
    [header addSubview:_headerContainer];
    [self.headerContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(separator.mas_top);
        make.left.right.equalTo(@0);
        make.height.equalTo(@140);
    }];
    
    return header;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
