//
//  UIViewController+Ext.m
//  SWDYD
//
//  Created by zijin on 2018/9/29.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "UIViewController+Ext.h"

@implementation UIViewController (Ext)
#pragma mark -- 设置返回按钮
/** 设置返回按钮 */
- (UIBarButtonItem *)rt_customBackItemWithTarget:(id)target action:(SEL)action {
    return [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:kSWBackItemRed]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
}

/** 返回按钮点击事件 */
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- 设置导航栏是否透明
- (void)sw_setNavBarTransparent:(BOOL)isTransparent {
    if (isTransparent) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    }
    else {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:kSWNavBackground] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:nil];
    }
}

@end
