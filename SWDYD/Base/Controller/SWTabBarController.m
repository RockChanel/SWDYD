//
//  SWTabBarController.m
//  SWDYD
//
//  Created by zijin on 2018/9/26.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWTabBarController.h"
#import "SWNavigationController.h"
#import "SWHomeViewController.h"
#import "SWMeViewController.h"
#import "SWCommunityViewController.h"
#import "SWMessageViewController.h"

@interface SWTabBarController ()

@end

@implementation SWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UITabBar appearance] setTintColor:[UIColor sw_red]];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:kSWTabBackground]];
    
    SWHomeViewController *homeVC = [[SWHomeViewController alloc]init];
    SWNavigationController *homeNav = [[SWNavigationController alloc]initWithRootViewController:homeVC];
    
    SWCommunityViewController *communityVC = [[SWCommunityViewController alloc]init];
    SWNavigationController *communityNav = [[SWNavigationController alloc]initWithRootViewController:communityVC];
    
    SWMessageViewController *messageVC = [[SWMessageViewController alloc]initWithStyle:UITableViewStylePlain];
    SWNavigationController *messageNav = [[SWNavigationController alloc]initWithRootViewController:messageVC];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    SWMeViewController *meVC = [[SWMeViewController alloc]initWithCollectionViewLayout:flowLayout];
    SWNavigationController *meNav = [[SWNavigationController alloc]initWithRootViewController:meVC];
    
    [self addChildVC:homeNav title:@"首页" image:@"home_tabbar_35x35_" selectedImage:@"home_tabbar_red_35x35_"];
    [self addChildVC:communityNav title:@"版区" image:@"community_tabbar_35x35_" selectedImage:@"community_tabbar_red_35x35_"];
    [self addChildVC:messageNav title:@"消息" image:@"message_tabbar_35x35_" selectedImage:@"message_tabbar_select_35x35_"];
    [self addChildVC:meNav title:@"我" image:@"me_tabbar_35x35_" selectedImage:@"me_tabbar_red_35x35_"];
}

- (void)addChildVC:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    childVC.tabBarItem.title = title;
    childVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:childVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
