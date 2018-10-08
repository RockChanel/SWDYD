//
//  NSString+Ext.m
//  SWDYD
//
//  Created by zijin on 2018/10/8.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "NSString+Ext.h"

@implementation NSString (Ext)

/** 校验手机号 */
- (BOOL)sw_validPhoneNum {
    return self.length == 11;
}

@end
