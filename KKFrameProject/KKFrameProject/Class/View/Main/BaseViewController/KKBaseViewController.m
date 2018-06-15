//
//  KKBaseViewController.m
//  KKFameProject
//
//  Created by 孔繁武 on 2018/6/4.
//  Copyright © 2018年 孔繁武. All rights reserved.
//

#import "KKBaseViewController.h"

@interface KKBaseViewController ()

@end

@implementation KKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}
- (void)setUpUI{
    self.view.backgroundColor = [UIColor RandomColor];
    [self setUpNavigationBar];
}

- (void)setUpNavigationBar{
    self.navigationBar.items = @[self.navItem];
    self.navigationBar.barTintColor = [UIColor KKColorWithHex:@"0xF6F6F6"];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor darkGrayColor]};
    [self.view addSubview:self.navigationBar];
}

- (void)setTitle:(NSString *)title{
    self.navItem.title = title;
    self.tabBarItem.title = title;
}

#pragma mark -- Lazy
- (KKNavigationBar *)navigationBar{
    if (!_navigationBar) {
        _navigationBar = [[KKNavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kNavigationBarHeight)];
    }
    return (KKNavigationBar *)_navigationBar;
}

- (UINavigationItem *)navItem{
    if (!_navItem) {
        _navItem = [[UINavigationItem alloc] init];
    }
    return _navItem;
}

@end
