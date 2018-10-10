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

/**
 发送请求 无加载提示
 */
- (void)requestWithMethod:(SWHttpMethod)method api:(nonnull NSString *)api parameters:(nullable id)parameters success:(nullable void(^) (SWJsonModel* _Nullable json))success failure:(nullable void(^) (NSError * _Nonnull error))failure;

/**
 发送请求

 @param message 加载提示 若为nil, 则不显示
 @param view 加载提示显示层 若为nil 则为window层
 @param method 请求类型
 @param api 请求路径
 @param parameters 请求参数
 @param success 成功回调
 @param failure 失败回调
 */
- (void)requestWithMessage:(NSString *)message onView:(UIView *)view  method:(SWHttpMethod)method api:(NSString *)api parameters:(id)parameters success:(void (^)(SWJsonModel* _Nullable json))success failure:(void (^)(NSError * _Nonnull error))failure;


@end
