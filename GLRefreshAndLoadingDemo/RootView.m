//
//  RootView.m
//  quanquan美食
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "RootView.h"

@implementation RootView
+(id)rootView
{
    return [[self alloc] init];
}
-(void)setRooterViewStatus:(RooterViewStatus)rooterViewStatus
{
    _rooterViewStatus=rooterViewStatus;
    switch (rooterViewStatus) {
        case RooterViewStatusPrepare:
            if([NSStringFromClass([self class]) isEqualToString:@"FooterView"])
            {
                [self.btnView setTitle:FooterPrepareText forState:UIControlStateNormal];
            }else
            {
                [self.btnView setTitle:HeaderPrepareText forState:UIControlStateNormal];
            }
            break;
        case RooterViewStatusBegin:
            if([NSStringFromClass([self class]) isEqualToString:@"FooterView"])
            {
                [self.btnView setTitle:FooterBeginText forState:UIControlStateNormal];
            }else
            {
                [self.btnView setTitle:HeaderBeginText forState:UIControlStateNormal];
            }
            break;
        case RooterViewStatusLoad:
            self.btnView.hidden=YES;
            self.view;
            break;
    }
}

//懒加载
-(UIButton *)btnView
{
    if(!_btnView)
    {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        btn.frame=self.bounds;
        _btnView=btn;
    }
    return _btnView;
}
-(UIView *)view
{
    if(!_view)
    {
        UIView *view=[UIView new];
        [self addSubview:view];
        view.frame=self.bounds;
        _view=view;
        
        UILabel *label=[UILabel new];
        [_view addSubview:label];
        if([NSStringFromClass([self class]) isEqualToString:@"FooterView"])
        {
            label.text=FooterLoadText;
        }else
        {
            label.text=HeaderLoadText;
        }
        label.frame=_view.bounds;
        label.textAlignment=NSTextAlignmentCenter;
        label.textColor=TextColor;
        
        UIActivityIndicatorView *activity=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_view addSubview:activity];
        activity.frame=CGRectMake(140, 30, 0, 0);
        [activity startAnimating];
    }
    return _view;
}

-(void)setScrollView:(UIScrollView *)scrollView
{
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
    _scrollView=scrollView;
    [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self willMoveToSuperview:self.scrollView];
    if(self.scrollView.isDragging)
    {
        CGPoint point=self.scrollView.contentOffset;
        if([NSStringFromClass([self class]) isEqualToString:@"HeaderView"])
        {
            if(point.y<=0  && point.y>-Height)
            {
                self.rooterViewStatus=RooterViewStatusPrepare;
            }else if(point.y<-Height)
            {
                self.rooterViewStatus=RooterViewStatusBegin;
            }
        }else
        {
            float contentOffY=self.scrollView.contentSize.height-self.scrollView.frame.size.height;
                        if(point.y>=contentOffY  && point.y<contentOffY+Height)
            {
                self.rooterViewStatus=RooterViewStatusPrepare;
            }else if(point.y>contentOffY+Height)
            {
                self.rooterViewStatus=RooterViewStatusBegin;
            }
        }
    }else
    {
        if(self.rooterViewStatus==RooterViewStatusBegin)
        {
            if([NSStringFromClass([self class]) isEqualToString:@"FooterView"])
            {
                self.rooterViewStatus=RooterViewStatusLoad;
                self.scrollView.contentInset=UIEdgeInsetsMake(0, 0, Height, 0);
                [_delegate footerRefreshAndLoadingWith:self tableView:self.scrollView];
            }else
            {
                self.rooterViewStatus=RooterViewStatusLoad;
                self.scrollView.contentInset=UIEdgeInsetsMake(Height, 0, 0, 0);
                [_delegate headerRefreshAndLoadingWith:self tableView:self.scrollView];
            }
        }
    }
}
-(void)removeAnimation
{
    [self.btnView removeFromSuperview];
    [self.view removeFromSuperview];
}
//加载完执行
-(void)didMoveToSuperview
{
    self.scrollView=(UIScrollView *)self.superview;
}
@end
