//
//  SWCollectionViewController.m
//  SWDYD
//
//  Created by zijin on 2018/9/28.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWCollectionViewController.h"

@interface SWCollectionViewController ()

@end

@implementation SWCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.alwaysBounceVertical = YES;
}

- (void)setShowRefreshHeader:(BOOL)showRefreshHeader {
    _showRefreshHeader = showRefreshHeader;
    if (showRefreshHeader) {
        self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    }
    else {
        self.collectionView.mj_header = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
