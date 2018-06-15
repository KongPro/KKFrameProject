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


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLID" forIndexPath:indexPath];
    cell.textLabel.text = @"11";
    cell.textLabel.textColor = [UIColor orangeColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%@",indexPath);
}

- (void)PushToVC{
    [self.navigationController pushViewController:[[KKTestViewController alloc] init] animated:YES];
}

@end
