//
//  SWSettingViewController.m
//  SWDYD
//
//  Created by zijin on 2018/9/28.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWSettingViewController.h"
#import "SWSettingListCell.h"
#import "SWSettingModel.h"
#import "SWWebViewController.h"

@interface SWSettingViewController ()
@property (nonatomic, strong) NSArray *datas;
@end

@implementation SWSettingViewController

static NSString * const cellId = @"cellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    self.datas = [SWSettingModel sw_meSettingList];
    self.tableView.tableFooterView = [self footerView];
    [self.tableView registerClass:[SWSettingListCell class] forCellReuseIdentifier:cellId];
}

- (void)logoutAction {
    [[SWClient shareClient] sw_logout];
}

- (UIView *)footerView {
    UIView *footer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.mj_w, 65)];
    
    UIButton *logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [logoutBtn setTitleColor:[UIColor sw_red] forState:UIControlStateNormal];
    [logoutBtn addTarget:self action:@selector(logoutAction) forControlEvents:UIControlEventTouchUpInside];
    logoutBtn.backgroundColor = [UIColor whiteColor];
    [footer addSubview:logoutBtn];
    [logoutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.right.equalTo(@(-10));
        make.top.equalTo(@8);
        make.height.equalTo(@45);
    }];
    
    return footer;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sectionList = _datas[section];
    return sectionList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *sectionList = _datas[indexPath.section];
    SWSettingModel *tempModel = sectionList[indexPath.row];
    SWSettingListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.model = tempModel;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *sectionList = _datas[indexPath.section];
    SWSettingModel *tempModel = sectionList[indexPath.row];
    switch (tempModel.tag) {
        case SWSettingDisclaimerTag:
        {
            SWWebViewController *webVC = [[SWWebViewController alloc]init];
            webVC.url = kSWURLDisclaimer;
            [self.navigationController pushViewController:webVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 7;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
