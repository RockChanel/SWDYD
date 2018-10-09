//
//  SWRecommandModel.h
//  SWDYD
//
//  Created by zijin on 2018/10/9.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWRecommandBanner : NSObject
@property (nonatomic, copy) NSString *promotionImage;
@property (nonatomic, copy) NSString *promotionPostId;
@property (nonatomic, assign) NSInteger promotionType;
@property (nonatomic, copy) NSString *promotionTag;
@property (nonatomic, copy) NSString *promotionTitle;
@end

@interface SWRecommandBannerList : NSObject
@property (nonatomic, strong) NSArray<SWRecommandBanner *> *promotionList;
@property (nonatomic, strong) NSArray<SWRecommandBanner *> *promotionBulletinList;
@end

@interface SWRecommandModel : NSObject

@end
