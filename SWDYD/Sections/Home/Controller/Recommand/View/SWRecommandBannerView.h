//
//  SWRecommandBannerView.h
//  SWDYD
//
//  Created by zijin on 2018/10/9.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SWRecommandBannerList, SWRecommandBanner;

@interface SWBottomBannerView : UIView
@property (nonatomic, strong) SWRecommandBanner *banner;
@end

@interface SWRecommandBannerView : UIView
@property (nonatomic, strong) SWRecommandBannerList *list;
@end
