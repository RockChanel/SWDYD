//
//  SWCollectionViewController.h
//  SWDYD
//
//  Created by zijin on 2018/9/28.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWCollectionViewController : UICollectionViewController
/** 当前加载页数 */
@property (nonatomic, assign) NSInteger page;
/** 每页加载数量 */
@property (nonatomic, assign) NSInteger perPage;

/** 是否启用下拉刷新 缺省为NO */
@property (nonatomic, assign) BOOL showRefreshHeader;
/** 是否启用上拉加载 缺省为NO */
@property (nonatomic, assign) BOOL showRefreshFooter;

/**
 是否自动加载数据

 @param animated 是否有加载动画
 */
- (void)autoHeaderRefresh:(BOOL)animated;

/** 下拉刷新 */
- (void)headerRefresh;
/** 上拉加载 */
- (void)footerRefresh;
/**
 结束刷新/加载

 @param isHeader 区分下拉刷新或上拉加载 YES:下拉 NO:上拉
 @param reload 是否重载数据
 */
- (void)endRefreshHeader:(BOOL)isHeader reload:(BOOL)reload;

@end
