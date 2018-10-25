//
//  SWHistoryViewController.m
//  SWDYD
//
//  Created by zijin on 2018/10/25.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWHistoryViewController.h"
#import "SWHistoryListCell.h"

@interface SWHistoryViewController ()

@end

@implementation SWHistoryViewController

static NSString * const cellId = @"cellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[SWHistoryListCell class] forCellReuseIdentifier:cellId];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SWHistoryListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
