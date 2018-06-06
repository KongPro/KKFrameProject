//
//  UIButton+KKButton.m
//  KKFameProject
//
//  Created by 孔繁武 on 2018/6/5.
//  Copyright © 2018年 孔繁武. All rights reserved.
//

#import "UIButton+KKButton.h"

@implementation UIButton (KKButton)

+ (instancetype)KKButtonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor highlightColor:(UIColor *)highlightColor{
    
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:highlightColor forState:UIControlStateHighlighted];
    [button sizeToFit];
    return button;
}

@end
