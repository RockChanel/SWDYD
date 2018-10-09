//
//  SWHotZoneViewController.m
//  SWDYD
//
//  Created by selwyn on 2018/10/1.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWHotZoneViewController.h"
#import "SWHotSubViewController.h"

@interface SWHotZoneViewController ()
@property (nonatomic, strong) NSArray *topics;
@end

@implementation SWHotZoneViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.titleSizeNormal = 16;
        self.titleSizeSelected = 16;
        self.menuViewStyle = WMMenuViewStyleFlood;
        self.menuViewLayoutMode = WMMenuViewLayoutModeScatter;
        self.titleColorSelected = [UIColor whiteColor];
        self.titleColorNormal = [UIColor sw_gray];
        self.progressColor = [UIColor sw_red];
        self.selectIndex = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.topics = @[@"热门", @"次元", @"日常", @"影音", @"游戏"];
    [self reloadData];
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return _topics.count;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return _topics[index];
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    SWHotSubViewController *subVC = [[SWHotSubViewController alloc]initWithCollectionViewLayout:flowLayout];
    subVC.category = _topics[index];
    return subVC;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    return CGRectMake(0, 0, self.view.mj_w, 40);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    return CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height - 40);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
