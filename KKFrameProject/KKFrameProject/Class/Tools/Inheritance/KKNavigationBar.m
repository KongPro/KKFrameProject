//
//  KKNavigationBar.m
//  KKFameProject
//
//  Created by 孔繁武 on 2018/6/5.
//  Copyright © 2018年 孔繁武. All rights reserved.
//

#import "KKNavigationBar.h"


@implementation KKNavigationBar

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //注意导航栏及状态栏高度适配
    self.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), kNavigationBarHeight);
    for (UIView *view in self.subviews) {
        if([NSStringFromClass([view class]) containsString:@"Background"]) {
            view.frame = self.bounds;
        }
        else if ([NSStringFromClass([view class]) containsString:@"ContentView"]) {
            CGRect frame = view.frame;
            frame.origin.y = kStatusBarHeight;
            frame.size.height = self.bounds.size.height - frame.origin.y;
            view.frame = frame;
        }
    }
    
//#ifdef __IPHONE_11_0
//    if (@available(iOS 11.0, *)) {
//
//        for (UIView *view in self.subviews) {
//            if([NSStringFromClass([view class]) containsString:@"Background"]) {
//                view.frame = self.bounds;
//            }
//            else if ([NSStringFromClass([view class]) containsString:@"ContentView"]) {
//                CGRect frame = view.frame;
//                frame.origin.y = kNavigationBarHeight - 44;
//                frame.size.height = self.bounds.size.height - frame.origin.y;
//                view.frame = frame;
//            }
//        }
//    }
//#endif
    
}

@end
