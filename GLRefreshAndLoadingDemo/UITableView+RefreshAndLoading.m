//
//  UITableView+RefreshAndLoading.m
//  quanquan美食
//
//  Created by qianfeng on 15/9/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "UITableView+RefreshAndLoading.h"
#import <objc/runtime.h>

static void * UITableViewFooterViewKey = (void *)@"UITableViewFooterViewKey";
static void * UITableViewHeaderViewKey = (void *)@"UITableViewHeaderViewKey";

@implementation UITableView (RefreshAndLoading)
-(id)footerView
{
    return objc_getAssociatedObject(self, UITableViewFooterViewKey);
}

-(void)setFooterView:(FooterView *)footerView
{
    objc_setAssociatedObject(self, UITableViewFooterViewKey, footerView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id)headerView
{
    return objc_getAssociatedObject(self, UITableViewHeaderViewKey);
}

-(void)setHeaderView:(HeaderView *)headerView
{
    objc_setAssociatedObject(self, UITableViewHeaderViewKey, headerView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)tableViewWithRefreshAndLoading
{
    FooterView *footerView = [FooterView footerView];
    [self addSubview:footerView];
    self.footerView = footerView;
    
    HeaderView *headerView = [HeaderView headerView];
    [self addSubview:headerView];
    self.headerView = headerView;

}
@end
