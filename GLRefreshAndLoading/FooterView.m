//
//  FooterView.m
//  quanquan美食
//
//  Created by qianfeng on 15/9/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "FooterView.h"
@implementation FooterView
{
    UIButton *_btnView;
    UIView *_view;
    UIScrollView *_scrollView;
}
+(id)footerView
{
    return [self rootView];
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    UITableView *tableView=(UITableView *)newSuperview;
    float x=0;
    float y=tableView.contentSize.height;
    float w=tableView.frame.size.width;
    float h=Height;
    self.backgroundColor=[UIColor redColor];
    self.frame=CGRectMake(x, y, w, h);
}
@end
