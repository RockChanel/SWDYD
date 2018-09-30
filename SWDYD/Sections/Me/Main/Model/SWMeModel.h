//
//  SWMeModel.h
//  SWDYD
//
//  Created by zijin on 2018/9/29.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWMeModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;
/** 生成我的页面数据 */
+ (NSArray<SWMeModel *> *)sw_meHomeList;
@end

