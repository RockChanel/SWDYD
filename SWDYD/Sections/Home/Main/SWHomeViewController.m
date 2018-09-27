//
//  SWHomeViewController.m
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWHomeViewController.h"
#import "SWFollowViewController.h"
#import "SWVideoViewController.h"
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
        self.titleColorNormal = [UIColor sw_darkGray];
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
    [self reloadData];
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return _topics.count;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return _topics[index];
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (0 == index) {
        return [[SWFollowViewController alloc]init];
    }
    else if (1 == index) {
        return [[SWRecommandViewController alloc]initWithStyle:UITableViewStylePlain];
    }
    return [[SWVideoViewController alloc]init];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    CGFloat leftMargin = 50;
    return CGRectMake(leftMargin, 0, self.view.frame.size.width - 2*leftMargin, SWNavigationBarHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
