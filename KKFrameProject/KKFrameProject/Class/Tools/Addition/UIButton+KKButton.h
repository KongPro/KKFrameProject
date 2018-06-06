//
//  UIButton+KKButton.h
//  KKFameProject
//
//  Created by 孔繁武 on 2018/6/5.
//  Copyright © 2018年 孔繁武. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (KKButton)

+ (instancetype)KKButtonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor highlightColor:(UIColor *)highlightColor;

@end
