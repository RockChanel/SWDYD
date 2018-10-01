//
//  SWInputModel.h
//  SWDYD
//
//  Created by zijin on 2018/9/30.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWInputModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *subitDetail;
@property (nonatomic, copy) NSString *tip;
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, assign) NSInteger maxLength;
@property (nonatomic, assign) NSInteger minLength;

@end
