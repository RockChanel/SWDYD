//
//  SWDYDTool.h
//  SWDYD
//
//  Created by zijin on 2018/9/28.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWDYDTool : NSObject

/** 整数转换成万，保留一位小数 */
+ (NSString *)convertIntegerNumber:(NSInteger)num;
+ (UIWindow *)mainWindow;

@end
