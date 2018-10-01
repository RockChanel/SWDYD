//
//  SWHotZoneModel.h
//  SWDYD
//
//  Created by selwyn on 2018/10/1.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWHotCategoryInfo: NSObject
@property (nonatomic, copy) NSString *areaName;
@property (nonatomic, copy) NSString *headImage;
@end

@interface SWHotCategoryInfoList: NSObject
@property (nonatomic, strong) NSArray<SWHotCategoryInfo *> *list;
@property (nonatomic, copy) NSString *category;
@end

@interface SWHotZoneModel : NSObject
@property (nonatomic, strong) NSArray<SWHotCategoryInfoList *> *categoryInfoList;
@property (nonatomic, strong) NSArray *categoryList;
@property (nonatomic, copy) NSString *category;
@end
