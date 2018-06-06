//
//  KKHomeController.m
//  KKFameProject
//
//  Created by 孔繁武 on 2018/6/4.
//  Copyright © 2018年 孔繁武. All rights reserved.
//

#import "KKHomeController.h"
#import "KKTestViewController.h"

@interface KKHomeController ()

@end

@implementation KKHomeController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)setUpUI{
    [super setUpUI];
    self.navItem.rightBarButtonItem = [UIBarButtonItem KKBarButtonItemWithTitle:@"好友" fontSize:17 target:self action:@selector(PushToVC) isBack:NO];
}
 
- (void)PushToVC{
    [self.navigationController pushViewController:[[KKTestViewController alloc] init] animated:YES];
}

@end
