//
//  SWProgressHUD.h
//  SWDYD
//
//  Created by zijin on 2018/10/8.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <SVProgressHUD.h>

@interface SWProgressHUD : SVProgressHUD

/**
 自动消失文字提示

 @param text 提示语
 */
+ (void)sw_showText:(NSString *)text;

@end
