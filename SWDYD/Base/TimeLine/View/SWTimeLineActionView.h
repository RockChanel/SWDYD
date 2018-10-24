//
//  SWTimeLineActionView.h
//  SWDYD
//
//  Created by zijin on 2018/10/10.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SWTimeLineLayout, SWTimeLineCell;
@interface SWTimeLineActionView : UIView
@property (nonatomic, strong) SWTimeLineLayout *layout;
@property (nonatomic, strong) SWTimeLineCell *cell;
@end
