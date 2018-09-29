//
//  SWMyMedalViewController.m
//  SWDYD
//
//  Created by zijin on 2018/9/29.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWMyMedalViewController.h"
#import "UIViewController+Ext.h"

@interface SWMyMedalViewController ()

@end

@implementation SWMyMedalViewController

static CGFloat const keyOffsetY = 100.0f;
static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView addObserver:self forKeyPath:SWKeyPath_ContentOffset options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:SWKeyPath_ContentOffset]) {
        CGFloat currentOffsetY = self.collectionView.contentOffset.y;
        [self sw_setNavBarTransparent:currentOffsetY >= keyOffsetY];
        self.title = currentOffsetY >= keyOffsetY ? @"":@"我的勋章墙";
    }
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

- (void)dealloc {
    [self.collectionView removeObserver:self forKeyPath:SWKeyPath_ContentOffset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
