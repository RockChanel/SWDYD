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

@interface SWMeViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray<SWMeModel *> *datas;
@property (nonatomic, strong) UIImageView *headerImage;
@property (nonatomic, strong) UIVisualEffectView *headerEffect;
@end

@implementation SWMeViewController

static CGFloat const ItemWidth = 60.0f;
static CGFloat const ItemHeight = 85.0f;
static CGFloat const EdgeMargin = 15.0f;
static CGFloat const HeaderImageHeight = 260.0f;
static CGFloat const HeaderHeight = 300.0f;
static NSInteger const RowCount = 4;
static NSString * const reuseIdentifier = @"Cell";

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self sw_setNavBarTransparent:YES];
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
    
    self.collectionView.contentInset = UIEdgeInsetsMake(HeaderHeight, 0, 0, 0);
    [self.collectionView registerClass:[SWMeCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self.collectionView addSubview:[self headerView]];
}

- (void)settingAction {
    SWSettingViewController *settingVC = [[SWSettingViewController alloc]initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = self.collectionView.contentOffset.y;
    if (offsetY < -HeaderImageHeight) {
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
    SWMeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.model = _datas[indexPath.item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(ItemWidth, ItemHeight);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(EdgeMargin, EdgeMargin, EdgeMargin, EdgeMargin);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *tempVC = nil;
    switch (indexPath.item) {
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
    return (self.view.mj_w - RowCount*ItemWidth - 2*EdgeMargin)/(RowCount - 1);
}

- (UIView *)headerView {
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, -HeaderHeight, self.view.mj_w, HeaderHeight)];
    
    self.headerImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.mj_w, HeaderImageHeight)];
    self.headerImage.image = [UIImage imageNamed:@"me_fragment_bg"];
    self.headerImage.clipsToBounds = YES;
    self.headerImage.contentMode = UIViewContentModeScaleAspectFill;
    [header addSubview:_headerImage];
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    self.headerEffect = [[UIVisualEffectView alloc] initWithEffect:blur];
    self.headerEffect.frame = _headerImage.frame;
    self.headerEffect.alpha = 0.3;
    [header addSubview:_headerEffect];
    
    UIImageView *cover = [[UIImageView alloc]init];
    cover.image = [UIImage imageNamed:@"me_header_cover_375x35_"];
    [header addSubview:cover];
    [cover mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(header.mas_bottom).offset(-75);
        make.left.right.equalTo(@0);
        make.height.equalTo(@35);
    }];
    
    UIView *container = [[UIView alloc]init];
    container.backgroundColor = [UIColor whiteColor];
    [header addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.bottom.equalTo(header.mas_bottom).offset(-10);
        make.top.equalTo(cover.mas_bottom).offset(-1);
    }];
    
    UIView *separator = [[UIView alloc]init];
    separator.backgroundColor = [UIColor sw_tableBg];
    [header addSubview:separator];
    [separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.top.equalTo(container.mas_bottom);
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
