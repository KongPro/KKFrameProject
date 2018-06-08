//
//  KKNavigationController.m
//  KKFameProject
//
//  Created by 孔繁武 on 2018/6/4.
//  Copyright © 2018年 孔繁武. All rights reserved.
//

#import "KKNavigationController.h"
#import "KKBaseViewController.h"

@interface KKNavigationController ()

@end

@implementation KKNavigationController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationBar.hidden = YES;
}

//   -----   重写基类的push方法   -----
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        if ([viewController isKindOfClass:[KKBaseViewController class]]) {
            NSString *title = @"返回";
            if (self.childViewControllers.count == 1) {
                KKBaseViewController *vc = self.childViewControllers.firstObject;
                title = vc.navItem.title.length ? vc.navItem.title : @"返回";
            }
            ((KKBaseViewController *)viewController).navItem.leftBarButtonItem = [UIBarButtonItem KKBarButtonItemWithTitle:title fontSize:17 target:self action:@selector(popToParentController) isBack:YES];
        }
    }
    [super pushViewController:viewController animated:YES];
}

- (void)popToParentController{
    [self popViewControllerAnimated:YES];
}

@end
