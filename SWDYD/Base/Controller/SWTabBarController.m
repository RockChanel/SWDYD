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

@interface SWTabBarController ()

@end

@implementation SWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.tintColor = [UIColor sw_red];
    [self.tabBar setShadowImage:[UIImage new]];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"Default_Skin_TabbarBackgroundImage_X_0x49_"]];
    
    SWHomeViewController *homeVC = [[SWHomeViewController alloc]init];
    SWNavigationController *homeNav = [[SWNavigationController alloc]initWithRootViewController:homeVC];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    SWMeViewController *meVC = [[SWMeViewController alloc]initWithCollectionViewLayout:flowLayout];
    SWNavigationController *meNav = [[SWNavigationController alloc]initWithRootViewController:meVC];
    
    [self addChildVC:homeNav title:@"首页" image:@"home_tabbar_35x35_" selectedImage:@"home_tabbar_red_35x35_"];
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
