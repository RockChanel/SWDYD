//
//  SWVideoListModel.h
//  SWDYD
//
//  Created by zijin on 2018/10/22.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWVideo : NSObject
@property (nonatomic, copy) NSString *postTitle;
@property (nonatomic, strong) NSArray<NSString *> *postCoverImageList;
@property (nonatomic, assign) NSInteger postReadCount;
@end

@interface SWVideoListModel : NSObject
@property (nonatomic, strong) NSArray<SWVideo *> *shortVideoPostList;
@end
