//
//  SWModel.h
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWModel : NSObject
@property (nonatomic, strong) id data;
@property (nonatomic, strong) NSNumber *code;
@property (nonatomic, copy) NSString *apiVersion;
@end


@interface SWObjectModel : NSObject
@property (nonatomic, strong) NSDictionary *data;
@end

@interface SWListModel : NSObject
@property (nonatomic, strong) NSArray *data;
@end
