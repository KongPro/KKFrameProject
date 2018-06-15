//
//  KKMainTabbarController.m
//  KKFameProject
//
//  Created by 孔繁武 on 2018/6/4.
//  Copyright © 2018年 孔繁武. All rights reserved.
//

#import "KKMainTabbarController.h"
#import "KKNavigationController.h"

@interface KKMainTabbarController ()

@end

@implementation KKMainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpChildControllers];
    [self setUpCenterTabbarItem];
}

- (void)setUpChildControllers{
    NSArray *consArray = [NSArray arrayWithObjects:
                          @{@"clsName" : @"KKHomeController" , @"title" : @"首页" , @"imageName" : @"tabbar_home"},
                          @{@"clsName" : @"KKMessageController" , @"title" : @"消息" , @"imageName" : @"tabbar_message"},
                          @{@"clsName" : @"UIViewController" , @"title" : @"" , @"imageName" : @"UIViewController"},
                          @{@"clsName" : @"KKDiscoverController" , @"title" : @"发现" , @"imageName" : @"tabbar_discover"},
                          @{@"clsName" : @"KKProfileController" , @"title" : @"我的" , @"imageName" : @"tabbar_profile"},nil];
    NSMutableArray *mutableArr = [NSMutableArray array];
    for (NSDictionary *dict in consArray) {
        [mutableArr addObject:[self setUpChildControler:dict]];
    }
    self.viewControllers = mutableArr;
}

 - (UIViewController *)setUpChildControler:(NSDictionary *)dict{
    
    UIViewController *cls = [[NSClassFromString(dict[@"clsName"]) alloc] init];
    NSString *tabImgName = dict[@"imageName"];
    NSString *vcTitle = dict[@"title"];
     
    cls.title = vcTitle;
    cls.tabBarItem.image = [[UIImage imageNamed:tabImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    cls.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted", tabImgName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [cls.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]} forState:UIControlStateSelected];
     
    return [[KKNavigationController alloc] initWithRootViewController:cls];
}

- (void)setUpCenterTabbarItem{
    NSInteger count = self.viewControllers.count;
    CGFloat w = self.tabBar.bounds.size.width / count - 1;
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    [self.tabBar addSubview:button];
    button.frame = CGRectInset(self.tabBar.bounds, 2 * w, 0);
}

//   -----   代码设置横竖屏   -----
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}
@end







