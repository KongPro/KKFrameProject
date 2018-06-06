//
//  UIBarButtonItem+KKBarButtonItem.h
//  KKFameProject
//
//  Created by 孔繁武 on 2018/6/5.
//  Copyright © 2018年 孔繁武. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (KKBarButtonItem)

+ (instancetype)KKBarButtonItemWithTitle:(NSString *)title fontSize:(CGFloat)fontSize target:(id)target action:(SEL)action isBack:(BOOL)isBack;
@end
