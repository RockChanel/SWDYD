//
//  SWMedalModel.h
//  SWDYD
//
//  Created by zijin on 2018/9/30.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWMedal: NSObject
@property (nonatomic, copy) NSString *medalId;
@property (nonatomic, assign) BOOL isHave;
@property (nonatomic, copy) NSString *medalName;
@property (nonatomic, copy) NSString *medalImage;
@property (nonatomic, assign) BOOL isNew;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) BOOL isShow;
@property (nonatomic, assign) BOOL isWore;
@end

@interface SWMedalUser: SWUserModel

@end

@interface SWMedalTypeList: NSObject
@property (nonatomic, strong) NSArray<SWMedal *> *medalList;
@property (nonatomic, copy) NSString *name;
@end

@interface SWMedalList: NSObject
@property (nonatomic, assign) NSInteger medalCount;
@property (nonatomic, strong) NSArray<SWMedalTypeList *> *allMedalList;
@property (nonatomic, copy) NSString *shareUrl;
@property (nonatomic, strong) SWMedalUser *userInfo;

+ (SWMedalList *)getShowMedalsWithList:(SWMedalList *)list;

@end
