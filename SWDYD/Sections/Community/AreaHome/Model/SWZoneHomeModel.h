//
//  SWZoneHomeModel.h
//  SWDYD
//
//  Created by zijin on 2018/10/9.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWZoneHomeCategory : NSObject
@property (nonatomic, copy) NSString *categoryName;
@property (nonatomic, copy) NSString *categoryId;
@end

@interface SWZoneHomeHeaderModel : NSObject
@property (nonatomic, copy) NSString *subAreaName;
@property (nonatomic, copy) NSString *subAreaUserCountName;
@property (nonatomic, copy) NSString *subAreaPostCountName;
@property (nonatomic, copy) NSString *subAreaHeadImage;
@property (nonatomic, copy) NSString *subAreaImage;
@property (nonatomic, copy) NSString *subAreaUserCount;
@property (nonatomic, copy) NSString *subAreaPostCount;
@property (nonatomic, strong) NSArray<NSString *> *subAreaPostCategories;
@property (nonatomic, strong) NSArray<NSString *> *subAreaPostCateId;
@property (nonatomic, strong) NSArray<SWZoneHomeCategory *> *subAreaCategoryInfoList;
@end

@interface SWZoneHomeModel : NSObject

@end
