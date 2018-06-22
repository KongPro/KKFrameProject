//
//  KKBaseTableViewController.m
//  KKFrameProject
//
//  Created by 孔繁武 on 2018/6/14.
//  Copyright © 2018年 孔繁武. All rights reserved.
//

#import "KKBaseTableViewController.h"

@interface KKBaseTableViewController ()

@end

@implementation KKBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

- (void)setUpUI{
    [super setUpUI];
    [self setUpTableView];
}

- (void)setUpTableView{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view insertSubview:self.tableView belowSubview:self.navigationBar];
    self.tableView.contentInset = UIEdgeInsetsMake(kNavigationBarHeight, 0, kTabbarHeight, 0);
    [self.tableView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)loadData{
    [self.refreshControl endRefreshing];
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger row = indexPath.row;
    NSInteger section = tableView.numberOfSections - 1;
    
    if (row < 0 || section < 0) {
        return;
    }
    NSInteger count = [tableView numberOfRowsInSection:section];
    if (row == count - 1 && !self.isPullUp) {
        self.isPullUp = true;
        [self loadData];
    }
}

#pragma mark -- Lazy
- (UIRefreshControl *)refreshControl{
    if (!_refreshControl) {
        _refreshControl = [[UIRefreshControl alloc] init];
    }
    return _refreshControl;
}
@end
