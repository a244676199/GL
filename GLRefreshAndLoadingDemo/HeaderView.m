//
//  HeaderView.m
//  quanquan美食
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "HeaderView.h"
@implementation HeaderView
+(id)headerView
{
    return [self rootView];
}
-(void)willMoveToSuperview:(UIView *)newSuperview
{
    UITableView *tableView=(UITableView *)newSuperview;
    float w=tableView.frame.size.width;
    float h=Height;
    float y=-h;
    float x=0;
    self.backgroundColor=BackgroundColor;
    self.frame=CGRectMake(x, y, w, h);
}

@end
