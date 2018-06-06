//
//  UIBarButtonItem+KKBarButtonItem.m
//  KKFameProject
//
//  Created by 孔繁武 on 2018/6/5.
//  Copyright © 2018年 孔繁武. All rights reserved.
//

#import "UIBarButtonItem+KKBarButtonItem.h"

@implementation UIBarButtonItem (KKBarButtonItem)

+ (instancetype)KKBarButtonItemWithTitle:(NSString *)title fontSize:(CGFloat)fontSize target:(id)target action:(SEL)action isBack:(BOOL)isBack{
    
    UIButton *btn = [UIButton KKButtonWithTitle:title fontSize:fontSize normalColor:[UIColor darkGrayColor] highlightColor:[UIColor orangeColor]];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    if (isBack) {
        [btn setImage:[UIImage imageNamed:@"navigationbar_back_withtext"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"navigationbar_back_withtext_highlighted"] forState:UIControlStateHighlighted];
        [btn sizeToFit];
    }
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return barButtonItem;
}

@end
