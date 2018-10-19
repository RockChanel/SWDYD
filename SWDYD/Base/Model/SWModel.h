//
//  SWModel.h
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWJsonModel : NSObject
@property (nonatomic, strong) id data;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *apiVersion;
@property (nonatomic, copy) NSString *message;
@end

@interface SWCookieModel : NSObject <NSCoding>
@property (nonatomic, copy) NSString *value;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *path;
@end
