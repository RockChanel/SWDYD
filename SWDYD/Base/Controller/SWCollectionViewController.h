//
//  SWCollectionViewController.h
//  SWDYD
//
//  Created by zijin on 2018/9/28.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWCollectionViewController : UICollectionViewController
@property (nonatomic, assign) BOOL showRefreshHeader;
@property (nonatomic, assign) BOOL showRefreshFooter;
- (void)loadData;
@end
