//
//  RootView.h
//  quanquan美食
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#include "Interface.h"
#import "RootView.h"
enum RooterViewStatus{
    RooterViewStatusPrepare,
    RooterViewStatusBegin,
    RooterViewStatusLoad
};
@class RootView;
typedef enum RooterViewStatus RooterViewStatus;

@protocol GLRefreshAndLoadingDelegate <NSObject>

-(void)headerRefreshAndLoadingWith:(RootView *)rootView tableView:(UIScrollView*)tableView;
-(void)footerRefreshAndLoadingWith:(RootView *)rootView tableView:(UIScrollView*)tableView;

@end
@interface RootView : UIView
@property (nonatomic,weak) UIButton *btnView;
@property (nonatomic,weak) UIView *view;
@property(nonatomic,weak)UIScrollView *scrollView;
@property(nonatomic,weak)id<GLRefreshAndLoadingDelegate> delegate;
@property (nonatomic,assign) RooterViewStatus rooterViewStatus;
+(id)rootView;
-(void)removeAnimation;
@end
