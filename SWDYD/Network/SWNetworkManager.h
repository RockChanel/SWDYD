//
//  SWNetworkManager.h
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 请求类型 */
typedef NS_ENUM(NSInteger, SWHttpMethod) {
    SWHttpMethodGet,
    SWHttpMethodPost,
    SWHttpMethodPut,
    SWHttpMethodPatch,
    SWHttpMethodDelete,
};

@class SWJsonModel;
@interface SWNetworkManager : NSObject

+ (nonnull instancetype)shareManager;

- (void)requestWithMethod:(SWHttpMethod)method api:(nonnull NSString *)api parameters:(nullable id)parameters success:(nullable void(^) (SWJsonModel* _Nullable json))success failure:(nullable void(^) (NSError * _Nonnull error))failure;


@end
