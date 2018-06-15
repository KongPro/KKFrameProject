//
//  KKBaseTableViewController.m
//  KKFrameProject
//
//  Created by 孔繁武 on 2018/6/14.
//  Copyright © 2018年 孔繁武. All rights reserved.
//

#import "KKBaseTableViewController.h"

@interface KKBaseTableViewController ()

//@property (nonatomic, strong) KKNavigationBar *navigationBar;

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
}

- (void)loadData{}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}


@end
