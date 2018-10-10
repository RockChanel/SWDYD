//
//  SWProgressHUD.m
//  SWDYD
//
//  Created by zijin on 2018/10/10.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWProgressHUD.h"

@implementation SWProgressHUD

+ (void)sw_showTip:(NSString *)tip {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[SWDYDTool mainWindow] animated:YES];
    hud.bezelView.color = [UIColor blackColor];
    hud.label.text = tip;
    hud.label.font = SWFont(14);
    hud.contentColor = [UIColor whiteColor];
    hud.mode = MBProgressHUDModeText;
    [hud hideAnimated:YES afterDelay:2.0];
}

+ (void)sw_showLoadingOnView:(UIView *)view {
    if (!view) view = [SWDYDTool mainWindow];
    MBProgressHUD *hud = [[self alloc] initWithView:view];
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
    hud.bezelView.color = [UIColor blackColor];
    hud.contentColor = [UIColor whiteColor];
    hud.removeFromSuperViewOnHide = YES;
    [view addSubview:hud];
    [hud showAnimated:YES];
}

+ (void)sw_showLoading:(NSString *)message onView:(UIView *)view {
    if (!view) view = [SWDYDTool mainWindow];
    MBProgressHUD *hud = [[self alloc] initWithView:view];
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
    hud.bezelView.color = [UIColor blackColor];
    hud.contentColor = [UIColor whiteColor];
    hud.label.text = message ?: @"正在加载";
    hud.removeFromSuperViewOnHide = YES;
    [view addSubview:hud];
    [hud showAnimated:YES];
}

+ (void)sw_hideForView:(UIView *)view {
    if (!view) view = [SWDYDTool mainWindow];
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
