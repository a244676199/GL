//
//  UITableView+RefreshAndLoading.h
//  quanquan美食
//
//  Created by qianfeng on 15/9/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"
#import "FooterView.h"
@interface UITableView (RefreshAndLoading)
@property(nonatomic,weak)HeaderView* headerView;
@property(nonatomic,weak)FooterView* footerView;
-(void)tableViewWithRefreshAndLoading;
@end
