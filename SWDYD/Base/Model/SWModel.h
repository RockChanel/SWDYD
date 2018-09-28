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
@property (nonatomic, strong) NSNumber *code;
@property (nonatomic, copy) NSString *apiVersion;
@end
