//
//  SWCollectionViewController.m
//  SWDYD
//
//  Created by zijin on 2018/9/28.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWCollectionViewController.h"
#import "SWRefreshGifHeader.h"

@interface SWCollectionViewController ()

@end

@implementation SWCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.alwaysBounceVertical = YES;
    
    _page = 1;
    _perPage = 10;
    _showRefreshHeader = NO;
    _showRefreshFooter = NO;
}

- (void)setShowRefreshHeader:(BOOL)showRefreshHeader {
    _showRefreshHeader = showRefreshHeader;
    if (_showRefreshHeader) {
        self.collectionView.mj_header = [SWRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    }
    else {
        self.collectionView.mj_header = nil;
    }
}

- (void)setShowRefreshFooter:(BOOL)showRefreshFooter {
    _showRefreshFooter = showRefreshFooter;
    if (_showRefreshFooter) {
        self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];
    }
    else {
        self.collectionView.mj_footer = nil;
    }
}

- (void)autoHeaderRefresh:(BOOL)animated {
    if (_showRefreshHeader) {
        if (animated) {
            [self.collectionView.mj_header beginRefreshing];
        }
        else {
            [self headerRefresh];
        }
    }
}

- (void)headerRefresh {
    
}

- (void)footerRefresh {
    
}

- (void)endRefreshHeader:(BOOL)isHeader reload:(BOOL)reload {
    SWWeakSelf
    dispatch_async(dispatch_get_main_queue(), ^{
        if (reload) {
            [weakSelf.collectionView reloadData];
        }
        if (isHeader) {
            [weakSelf.collectionView.mj_header endRefreshing];
        }
        else{
            [weakSelf.collectionView.mj_footer endRefreshing];
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
