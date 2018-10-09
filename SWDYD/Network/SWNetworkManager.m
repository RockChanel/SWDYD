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
        [self.sessionManager.requestSerializer setValue:@"session_id=\"2|1:0|10:1537948161|10:session_id|24:YTkwNDA3NzZlNTk0NDRhNw==|05e2385157c309343a474ea21a535753b224f44729969904a113a13a12ebb51f\"; token_id=\"2|1:0|10:1537948170|8:token_id|44:MmRyNTcwZ2I4d2ppbzludGttYXBsNnozMWNxdXNldjQ=|5cbbb1ae78561616ea22f9a8cc5c07a21a958fd7f28244c7b36dd2d169a43005\"" forHTTPHeaderField:@"cookie"];
        
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
