//
//  SWTableViewController.m
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWTableViewController.h"

@interface SWTableViewController ()

@end

@implementation SWTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor sw_tableBg];
}

- (void)setShowRefreshHeader:(BOOL)showRefreshHeader {
    _showRefreshHeader = showRefreshHeader;
    if (_showRefreshHeader) {
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    }
    else {
        self.tableView.mj_header = nil;
    }
}

- (void)setShowRefreshFooter:(BOOL)showRefreshFooter {
    _showRefreshFooter = showRefreshFooter;
    if (_showRefreshFooter) {
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];
    }
    else {
        self.tableView.mj_footer = nil;
    }
}

- (void)autoHeaderRefresh:(BOOL)animated {
    if (_showRefreshHeader) {
        if (animated) {
            [self.tableView.mj_header beginRefreshing];
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
            [weakSelf.tableView reloadData];
        }
        if (isHeader) {
            [weakSelf.tableView.mj_header endRefreshing];
        }
        else{
            [weakSelf.tableView.mj_footer endRefreshing];
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
