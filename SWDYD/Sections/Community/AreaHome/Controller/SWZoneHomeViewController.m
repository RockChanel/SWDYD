//
//  SWZoneHomeViewController.m
//  SWDYD
//
//  Created by selwyn on 2018/10/3.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWZoneHomeViewController.h"
#import "SWZoneHomeHeaderView.h"
#import "SWHotSubViewController.h"

@interface SWZoneHomeViewController ()
@property (nonatomic, strong) NSArray *topics;
@property (nonatomic, strong) SWZoneHomeHeaderView *headerView;
@end

@implementation SWZoneHomeViewController

static CGFloat const SWMenuViewHeight = 44.0;
static CGFloat const SWHeaderViewHeight = 250.0;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.titleSizeNormal = 14;
        self.titleSizeSelected = 14;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuViewLayoutMode = WMMenuViewLayoutModeScatter;
        self.titleColorSelected = [UIColor sw_black];
        self.titleColorNormal = [UIColor sw_gray];
        self.progressViewIsNaughty = YES;
        self.progressWidth = 20;
        self.progressHeight = 3;
        self.progressViewCornerRadius = 1.5;
        self.selectIndex = 0;
        self.progressColor = [UIColor sw_black];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.topics = @[@"全部", @"头像", @"壁纸", @"热门", @"最新"];;
    self.menuViewHeight = SWMenuViewHeight;
    self.maximumHeaderViewHeight = SWHeaderViewHeight;
    self.minimumHeaderViewHeight = SWNavigationBarHeight + SWStatusBarHeight;
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:SWBoldFont(16), NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"search_white_30x30_"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(searchAction)];
    
    UIBarButtonItem *detailItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"subarea_detail_30x30_"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(detailAction)];
    
    self.navigationItem.rightBarButtonItems = @[searchItem, detailItem];
    
    self.headerView = [[SWZoneHomeHeaderView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:_headerView];
    
    [self reloadData];
}

- (void)detailAction {
    
}

- (void)searchAction {
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat headerViewHeight = SWHeaderViewHeight;
    CGFloat headerViewX = 0;
    UIScrollView *scrollView = (UIScrollView *)self.view;
    if (scrollView.contentOffset.y < 0) {
        headerViewX = scrollView.contentOffset.y;
        headerViewHeight -= headerViewX;
    }
    self.headerView.frame = CGRectMake(0, headerViewX, self.view.mj_w, headerViewHeight);
}

#pragma mark - ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [super scrollViewDidScroll:scrollView];
    if (scrollView.contentOffset.y < 0) {
        [self.view setNeedsLayout];
    }
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return _topics.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    SWHotSubViewController *subVC = [[SWHotSubViewController alloc]initWithCollectionViewLayout:flowLayout];
    subVC.category = @"次元";
    return subVC;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return _topics[index];
}

/** 设置返回按钮 */
- (UIBarButtonItem *)rt_customBackItemWithTarget:(id)target action:(SEL)action {
    return [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:SWBackItem_White]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
}

/** 返回按钮点击事件 */
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end