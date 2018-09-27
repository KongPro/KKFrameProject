//
//  KKNavigationController.m
//  KKFameProject
//
//  Created by 孔繁武 on 2018/6/4.
//  Copyright © 2018年 孔繁武. All rights reserved.
//

#import "KKNavigationController.h"
#import "KKBaseViewController.h"

@interface KKNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation KKNavigationController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationBar.hidden = YES;
    
    // 禁用系统自带的返回手势
    self.interactivePopGestureRecognizer.enabled = NO;
    // 获取系统自带手势的代理对象，让他帮我们做我们自定义手势的ttarget
    id target = self.interactivePopGestureRecognizer.delegate;
    // 获取系统自带的手势返回执行的方法  (打印self.interactivePopGestureRecognizer可以查看)
    UIView *targetView = self.interactivePopGestureRecognizer.view;
    
    SEL panAction = NSSelectorFromString(@"handleNavigationTransition:");
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:panAction];
    panGesture.delegate = self;
    [targetView addGestureRecognizer:panGesture];
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return self.viewControllers.count > 1 && ![[self valueForKey:@"_isTransitioning"] boolValue];  // 根控制器禁用返回手势
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    // 如果当前拖动的是滚动视图，则恢复系统侧滑手势，否则使用自定义全屏返回手势
    if ([touch.view isKindOfClass:[UIScrollView class]]) {
        self.interactivePopGestureRecognizer.enabled = YES;
        return NO;
    }else{
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    //当拖动的是slider时，该事件不让syPanGesture手势响应
    if ([touch.view isKindOfClass:[UISlider class]]) {
        return NO;
    }
    return YES;
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
