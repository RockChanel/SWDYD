//
//  SWDYDTool.m
//  SWDYD
//
//  Created by zijin on 2018/9/28.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWDYDTool.h"

@implementation SWDYDTool

/** 整数转换成万，保留一位小数 */
+ (NSString *)convertIntegerNumber:(NSInteger)num {
    return [NSString stringWithFormat:@"%.1f万", num/10000.0];
}

@end
