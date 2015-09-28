//
//  ViewController.m
//  GLRefreshAndLoadingDemo
//
//  Created by qianfeng on 15/9/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+RefreshAndLoading.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,GLRefreshAndLoadingDelegate>
{
    UITableView *_tableView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView=[[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    [_tableView tableViewWithRefreshAndLoading];
    _tableView.headerView.delegate=self;
    _tableView.footerView.delegate=self;
}
-(void)headerRefreshAndLoadingWith:(RootView *)rootView tableView:(UIScrollView *)tableView
{
    [UIView animateWithDuration:0.5 delay:2 options:0 animations:^{
        //这里输出为测试
         NSLog(@"headerRefreshAndLoadingWith:%@",[rootView class]);
        /*
            这里实现下拉刷新功能
         
            刷新功能结束，调用 [rootView removeAnimation] ;
         */
        tableView.contentInset=UIEdgeInsetsMake(0, 0, 0, 0);
    } completion:^(BOOL finished) {
        [rootView removeAnimation];
    }];
}
-(void)footerRefreshAndLoadingWith:(RootView *)rootView tableView:(UIScrollView *)tableView
{
    [UIView animateWithDuration:0.5 delay:2 options:0 animations:^{
        //这里输出为测试
        NSLog(@"footerRefreshAndLoadingWith:%@",[rootView class]);
        /*
            这里实现上拉加载更多功能
         
            刷新功能结束，调用 [rootView removeAnimation] ;
         */
        tableView.contentInset=UIEdgeInsetsMake(0, 0, 0, 0);
    } completion:^(BOOL finished) {
        [rootView removeAnimation];
    }];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc] init];
    cell.textLabel.text=@"123";
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
