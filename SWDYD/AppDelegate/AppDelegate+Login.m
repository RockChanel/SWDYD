//
//  AppDelegate+Login.m
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "AppDelegate+Login.h"
#import "SWLoginViewController.h"
#import "SWNavigationController.h"
#import "SWTabBarController.h"

@implementation AppDelegate (Login)

- (void)sw_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //注册登录状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginStateChange:) name:SWNotification_LoginStateChange object:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:SWNotification_LoginStateChange object:[NSNumber numberWithBool:[SWClient shareClient].isAutoLogin]];
}

#pragma mark -- 登录状态变更
- (void)loginStateChange:(NSNotification *)notification {
    BOOL autoLogin = [notification.object boolValue];
    
    if (autoLogin) {
        SWTabBarController *tabBarVC = [[SWTabBarController alloc]init];
        self.window.rootViewController = tabBarVC;
    }
    else {
        SWLoginViewController *loginVC = [[SWLoginViewController alloc]init];
        SWNavigationController *loginNav = [[SWNavigationController alloc]initWithRootViewController:loginVC];
        self.window.rootViewController = loginNav;
    }
}

@end
