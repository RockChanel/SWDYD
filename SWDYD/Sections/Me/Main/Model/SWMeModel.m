//
//  SWMeModel.m
//  SWDYD
//
//  Created by zijin on 2018/9/29.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWMeModel.h"

static inline SWMeModel *MeModel(NSString *title, NSString *icon) {
    SWMeModel *model = [[SWMeModel alloc]init];
    model.title = title;
    model.icon = icon;
    return model;
}

@implementation SWMeModel

+ (NSArray<SWMeModel *> *)sw_meHomeList {
    NSMutableArray<SWMeModel *> *tempList = [NSMutableArray array];
    SWMeModel *home = MeModel(@"我的主页", @"me_myHome_32x32_");
    [tempList addObject:home];
    SWMeModel *medal = MeModel(@"我的勋章", @"me_medal_32x32_");
    [tempList addObject:medal];
    SWMeModel *collect = MeModel(@"我的收藏", @"me_collect_32x32_");
    [tempList addObject:collect];
    SWMeModel *download = MeModel(@"我的下载", @"me_myDownload_32x32_");
    [tempList addObject:download];
    SWMeModel *wallet = MeModel(@"我的钱包", @"me_wallet_32x32_");
    [tempList addObject:wallet];
    SWMeModel *games = MeModel(@"游戏中心", @"me_games_32x32_");
    [tempList addObject:games];
    SWMeModel *friend = MeModel(@"添加好友", @"me_firend_32x32_");
    [tempList addObject:friend];
    SWMeModel *history = MeModel(@"浏览历史", @"me_history_32x32_");
    [tempList addObject:history];
    SWMeModel *candyShop = MeModel(@"糖果商城", @"me_candyShop_32x32_");
    [tempList addObject:candyShop];
    SWMeModel *trading = MeModel(@"交易屋", @"me_trading_32x32_");
    [tempList addObject:trading];
    SWMeModel *tools = MeModel(@"小工具", @"me_tools_32x32_");
    [tempList addObject:tools];
    SWMeModel *feedback = MeModel(@"意见反馈", @"me_feedback_32x32_");
    [tempList addObject:feedback];
    return tempList;
}

@end
