//
//  SWAlbumViewController.m
//  SWDYD
//
//  Created by zijin on 2018/10/26.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWAlbumViewController.h"
#import "SWAlbumListCell.h"

@interface SWAlbumViewController ()

@end

@implementation SWAlbumViewController

static NSString * const cellId = @"cellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)addAction {
    
}

- (void)setup {
    [self.tableView registerClass:[SWAlbumListCell class] forCellReuseIdentifier:cellId];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setTitle:@"+创建收藏夹" forState:UIControlStateNormal];
    [addBtn setTitleColor:[UIColor sw_gray] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.height.equalTo(@40);
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SWAlbumListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
