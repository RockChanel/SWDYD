//
//  SWMessageViewController.m
//  SWDYD
//
//  Created by zijin on 2018/10/19.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWMessageViewController.h"

@interface SWMessageViewController ()

@end

@implementation SWMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息";
    
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
