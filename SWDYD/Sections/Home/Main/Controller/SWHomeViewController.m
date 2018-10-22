//
//  SWHomeViewController.m
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWHomeViewController.h"
#import "SWFollowViewController.h"
#import "SWVideoListViewController.h"
#import "SWRecommandViewController.h"

@interface SWHomeViewController ()
@property (nonatomic, strong) NSArray *topics;
@end

@implementation SWHomeViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.titleSizeNormal = 16;
        self.titleSizeSelected = 16;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.automaticallyCalculatesItemWidths = YES;
        self.showOnNavigationBar = YES;
        self.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
        self.titleColorSelected = [UIColor sw_black];
        self.titleColorNormal = [UIColor sw_gray];
        self.progressViewIsNaughty = YES;
        self.progressWidth = 20;
        self.progressHeight = 3;
        self.progressViewCornerRadius = 1.5;
        self.itemMargin = 20;
        self.selectIndex = 1;
        self.progressColor = [UIColor sw_black];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.topics = @[@"关注", @"推荐", @"视频"];
    
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"home_search_icon_30x30_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style: UIBarButtonItemStylePlain target:self action:@selector(searchAction)];
    self.navigationItem.rightBarButtonItem = searchItem;
    
    [self reloadData];
}

- (void)searchAction {
    
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return _topics.count;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return _topics[index];
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (0 == index) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        return [[SWFollowViewController alloc]initWithCollectionViewLayout:flowLayout];
    }
    else if (1 == index) {
        return [[SWRecommandViewController alloc]initWithStyle:UITableViewStyleGrouped];
    }
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    return [[SWVideoListViewController alloc]initWithCollectionViewLayout:flowLayout];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    CGFloat margin = 80;
    return CGRectMake(0, 0, self.view.mj_w - 2*margin, SWNavigationBarHeight);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    return CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
