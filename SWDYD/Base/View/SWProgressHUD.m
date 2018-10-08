//
//  SWProgressHUD.m
//  SWDYD
//
//  Created by zijin on 2018/10/8.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWProgressHUD.h"

@implementation SWProgressHUD

+ (void)initialize {
    [self setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [self setDefaultStyle:SVProgressHUDStyleDark];
    [self setCornerRadius:4.0];
}

// 根据 提示文字字数，判断 HUD 显示时间
+ (NSTimeInterval)displayDurationForString:(NSString*)string {
    return MIN((float)string.length*0.06 + 0.6, 2.0);
}

+ (void)sw_showText:(NSString *)text {
    [self showInfoWithStatus:text];
    [self dismissWithDelay:[self displayDurationForString:text]];
}

@end
