//
//  SWZoneHomeViewController.m
//  SWDYD
//
//  Created by selwyn on 2018/10/3.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWZoneHomeViewController.h"
#import "SWZoneHomeHeaderView.h"
#import "SWZoneHomeModel.h"
#import "SWZoneSubViewController.h"

@interface SWZoneHomeViewController ()
@property (nonatomic, strong) NSArray *topics;
@property (nonatomic, strong) NSArray<SWZoneHomeCategory *> *topicList;
@property (nonatomic, strong) SWZoneHomeHeaderView *headerView;
@property (nonatomic, assign) CGFloat headerHeight;
@end

@implementation SWZoneHomeViewController

static CGFloat const SWMenuViewHeight = 44.0;

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

- (void)loadHeaderData {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"appChannel"] = kSWAppChannel;
    params[@"isUpgrade"] = kSWIsUpgrade;
    params[@"versionName"] = kSWVersionName;
    params[@"subAreaPageFrom"] = @"section_hot";
    params[@"subAreaId"] = _areaId;
    
    [[SWNetworkManager shareManager] requestWithMethod:SWHttpMethodGet api:kSWApiHotZoneHead parameters:params success:^(SWJsonModel * _Nullable json) {
        SWZoneHomeHeaderModel *headerModel = [SWZoneHomeHeaderModel yy_modelWithJSON:json.data];
        self.title = headerModel.subAreaName;
        self.headerView.model = headerModel;
        self.topics = headerModel.subAreaPostCategories;
        self.topicList = headerModel.subAreaCategoryInfoList;
        [self reloadData];
    } failure:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.headerHeight = SWNavigationBarHeight + SWStatusBarHeight + 186;
    self.menuViewHeight = SWMenuViewHeight;
    self.maximumHeaderViewHeight = _headerHeight;
    self.minimumHeaderViewHeight = SWNavigationBarHeight + SWStatusBarHeight;
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:SWBoldFont(16), NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"search_white_30x30_"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(searchAction)];
    
    UIBarButtonItem *detailItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"subarea_detail_30x30_"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(detailAction)];
    
    self.navigationItem.rightBarButtonItems = @[detailItem, searchItem];
    
    self.headerView = [[SWZoneHomeHeaderView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:_headerView];
    
    [self loadHeaderData];
}

- (void)detailAction {
    
}

- (void)searchAction {
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat headerViewHeight = _headerHeight;
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
    return self.topics.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    SWZoneSubViewController *subVC = [[SWZoneSubViewController alloc]initWithStyle:UITableViewStylePlain];
    if (index < self.topicList.count) {
        subVC.category = self.topicList[index];
    }
    return subVC;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.topics[index];
}

/** 设置返回按钮 */
- (UIBarButtonItem *)rt_customBackItemWithTarget:(id)target action:(SEL)action {
    return [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:kSWBackItemWhite]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
}

/** 返回按钮点击事件 */
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (NSArray *)topics {
    if (!_topics) {
        _topics = [NSArray array];
    }
    return _topics;
}

- (NSArray *)topicList {
    if (!_topicList) {
        _topicList = [NSArray array];
    }
    return _topicList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
