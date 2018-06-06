//
//  KKTestViewController.m
//  KKFameProject
//
//  Created by 孔繁武 on 2018/6/4.
//  Copyright © 2018年 孔繁武. All rights reserved.
//

#import "KKTestViewController.h"

@interface KKTestViewController ()

@end

@implementation KKTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)setUpUI{
    [super setUpUI];
    self.navItem.rightBarButtonItem = [UIBarButtonItem KKBarButtonItemWithTitle:@"下一个" fontSize:17 target:self action:@selector(pushToNext) isBack:NO];
    self.title = [NSString stringWithFormat:@"%ld",(long)self.navigationController.childViewControllers.count];
}

- (void)pushToNext{
    
    KKTestViewController *vc = [[KKTestViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
