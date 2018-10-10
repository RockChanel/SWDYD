//
//  SWSettingModel.m
//  SWDYD
//
//  Created by zijin on 2018/10/9.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWSettingModel.h"

static inline SWSettingModel *SettingModel(NSString *title, NSString *detail, NSInteger tag) {
    SWSettingModel *model = [[SWSettingModel alloc]init];
    model.title = title;
    model.detail = detail;
    model.tag = tag;
    model.on = NO;
    model.showArrow = YES;
    return model;
}

@implementation SWSettingModel

+ (NSArray *)sw_meSettingList {
    NSMutableArray *tempList = [NSMutableArray arrayWithCapacity:3];
    
    NSMutableArray<SWSettingModel *> *sectionList1 = [NSMutableArray array];
    SWSettingModel *profile = SettingModel(@"个人资料", nil, SWSettingProfileTag);
    [sectionList1 addObject:profile];
    SWSettingModel *blackList = SettingModel(@"黑名单", nil, SWSettingBlackListTag);
    [sectionList1 addObject:blackList];
    SWSettingModel *nightMode = SettingModel(@"夜间模式", nil, SWSettingNightModeTag);
    nightMode.showArrow = NO;
    [sectionList1 addObject:nightMode];
    SWSettingModel *autoPlay = SettingModel(@"WiFi下自动播放视频", nil, SWSettingAutoPlayTag);
    autoPlay.showArrow = NO;
    [sectionList1 addObject:autoPlay];
    SWSettingModel *clearCache = SettingModel(@"清除缓存", nil, SWSettingClearCacheTag);
    [sectionList1 addObject:clearCache];
    [tempList addObject:sectionList1];
    
    NSMutableArray<SWSettingModel *> *sectionList2 = [NSMutableArray array];
    SWSettingModel *autoReply = SettingModel(@"自动回复", nil, SWSettingAutoReplyTag);
    [sectionList2 addObject:autoReply];
    SWSettingModel *mailM = SettingModel(@"私信弹弹娘", nil, SWSettingMailMTag);
    [sectionList2 addObject:mailM];
    SWSettingModel *mailS = SettingModel(@"私信弹弹妹", nil, SWSettingMailSTag);
    [sectionList2 addObject:mailS];
    [tempList addObject:sectionList2];
    
    NSMutableArray<SWSettingModel *> *sectionList3 = [NSMutableArray array];
    SWSettingModel *version = SettingModel(@"版本号", nil, SWSettingVersionTag);
    version.showArrow = NO;
    [sectionList3 addObject:version];
    SWSettingModel *convention = SettingModel(@"用户公约", nil, SWSettingConventionTag);
    [sectionList3 addObject:convention];
    SWSettingModel *disclaimer = SettingModel(@"免责声明", nil, SWSettingDisclaimerTag);
    [sectionList3 addObject:disclaimer];
    SWSettingModel *business = SettingModel(@"商务合作", nil, SWSettingBusinessTag);
    [sectionList3 addObject:business];
    [tempList addObject:sectionList3];
    
    return tempList;
}

@end
