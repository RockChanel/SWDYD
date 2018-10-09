//
//  SWNetworkManager.m
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWNetworkManager.h"
#import <AFHTTPSessionManager.h>

@interface SWNetworkManager()
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@end
@implementation SWNetworkManager

+ (instancetype)shareManager {
    static SWNetworkManager *_networkManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_networkManager) {
            _networkManager = [[SWNetworkManager alloc] init];
        }
    });
    return _networkManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.sessionManager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:SWBaseURL]];
        self.sessionManager.requestSerializer.timeoutInterval = 30.0f;
        self.sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        self.sessionManager.requestSerializer= [AFHTTPRequestSerializer serializer];
        
        [self.sessionManager.requestSerializer setValue:@"1511ae9c947386af25b2d6" forHTTPHeaderField:@"deviceid"];
        [self.sessionManager.requestSerializer setValue:@"session_id=\"2|1:0|10:1539066441|10:session_id|24:NzJhOGYzOTNhN2U4NDU0Nw==|c9eef7e157cff6056017c10d7a3e7b06c1afa6afcba4a3a2b5769888ac7d001f\"; token_id=\"2|1:0|10:1539066441|8:token_id|44:djh6YjBvMzYyeWNnN3I5a2lxaHM0eGVsbXVuZnAxZGo=|89977ea0029f9c04e74cfc1825b4239708ad47b6ea0ae5b95df0837fe1d10864\"" forHTTPHeaderField:@"cookie"];
        
        // 证书配置
        NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"mfp" ofType:@"cer"];
        NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
        NSSet *cerSet = [NSSet setWithObjects:cerData, nil];
        self.sessionManager.securityPolicy.pinnedCertificates = cerSet;
        // 客户端是否信任非法证书
        self.sessionManager.securityPolicy.allowInvalidCertificates = YES;
        // 是否在证书域字段中验证域名
        self.sessionManager.securityPolicy.validatesDomainName = NO;
    }
    return self;
}

- (void)requestWithMethod:(SWHttpMethod)method api:(NSString *)api parameters:(id)parameters success:(void (^)(SWJsonModel* _Nullable json))success failure:(void (^)(NSError * _Nonnull error))failure {
    switch (method) {
        case SWHttpMethodGet:
        {
            [self.sessionManager GET:api parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                SWJsonModel *jsonModel = [SWJsonModel yy_modelWithJSON:json];
                if (success) {
                    success(jsonModel);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"SWError == %@", error);
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
        case SWHttpMethodPost:
        {
            [SWProgressHUD show];
            [self.sessionManager POST:api parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [SWProgressHUD dismiss];
                });
                id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                SWJsonModel *jsonModel = [SWJsonModel yy_modelWithJSON:json];
                if (jsonModel.code == 200) {
                    
                }
                else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [SWProgressHUD sw_showText:jsonModel.message];
                    });
                }
                if (success) {
                    success(jsonModel);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [SWProgressHUD dismiss];
                });
                NSLog(@"SWError == %@", error);
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
        case SWHttpMethodDelete:
        {
            [SWProgressHUD show];
            [self.sessionManager DELETE:api parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [SWProgressHUD dismiss];
                });
                id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                SWJsonModel *jsonModel = [SWJsonModel yy_modelWithJSON:json];
                if (jsonModel.code == 200) {
                    
                }
                else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [SWProgressHUD sw_showText:jsonModel.message];
                    });
                }
                if (success) {
                    success(jsonModel);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [SWProgressHUD dismiss];
                });
                NSLog(@"SWError == %@", error);
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
        default:
            break;
    }
}

@end
