//
//  UIColor+KKColor.h
//  KKFameProject
//
//  Created by 孔繁武 on 2018/6/5.
//  Copyright © 2018年 孔繁武. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (KKColor)

+ (instancetype)RandomColor;

+ (instancetype)RandomColor:(CGFloat)alpha;

+ (instancetype)KKColorWithHex:(NSString *)hexStr;
//+ (instancetype)KKColorWithHex:(NSString *)hexStr alpha:(CGFloat)alpha;

@end
