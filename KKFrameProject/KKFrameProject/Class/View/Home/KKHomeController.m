//
//  KKHomeController.m
//  KKFrameProject
//
//  Created by 孔繁武 on 2018/6/15.
//  Copyright © 2018年 孔繁武. All rights reserved.
//

#import "KKHomeController.h"
#import "KKTestViewController.h"

@interface KKHomeController ()


@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation KKHomeController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELLID"];
}

- (void)setUpUI{
    [super setUpUI];
    self.navItem.rightBarButtonItem = [UIBarButtonItem KKBarButtonItemWithTitle:@"好友" fontSize:17 target:self action:@selector(PushToVC) isBack:NO];
}

- (void)loadData{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (int i = 0; i < 10; i++) {
            if (self.isPullUp) {
                [self.dataArray addObject:[NSString stringWithFormat:@"上拉%d",i]];
            }else{
                [self.dataArray insertObject:[NSString stringWithFormat:@"%d",i] atIndex:0];
            }
        }
        [self.refreshControl endRefreshing];
        self.isPullUp = false;
        [self.tableView reloadData];
    });
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLID" forIndexPath:indexPath];
    NSString *str = self.dataArray[indexPath.row];
    cell.textLabel.text = str;
    cell.textLabel.textColor = [UIColor orangeColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%@",indexPath);
}

- (void)PushToVC{
    [self.navigationController pushViewController:[[KKTestViewController alloc] init] animated:YES];
}

#pragma mark --  Lazy
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
@end
