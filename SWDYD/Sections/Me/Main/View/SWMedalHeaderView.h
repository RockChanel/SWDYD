//
//  SWMedalHeaderView.h
//  SWDYD
//
//  Created by selwyn on 2018/9/29.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWMedalHeaderView : UICollectionReusableView
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *medal;
@property (nonatomic, copy) NSInteger medalCount;
@end
