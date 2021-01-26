//
//  UIButton+BorderColor.h
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/1/22.
//  Copyright © 2021 BN. All rights reserved.
//

/*
 [_button1 setBorderColor:UIColor.lightGrayColor forState:UIControlStateNormal];
 [_button1 setBorderColor:UIColor.systemBlueColor forState:UIControlStateSelected];
 [_button1 setCornerRadius:4 forState:UIControlStateNormal];
 [_button1 setCornerRadius:14 forState:UIControlStateSelected];
 
 - (void)handleAction:(UIButton *)sender{
     sender.selected = !sender.selected;
 }
 **/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Border)

- (void)setBorderColor:(nullable UIColor *)color forState:(UIControlState)state;
- (nullable UIColor *)borderColorForState:(UIControlState)state;

- (void)setBorderWidth:(CGFloat)value forState:(UIControlState)state;
- (CGFloat)borderWidthForState:(UIControlState)state;
    
- (void)setCornerRadius:(CGFloat)value forState:(UIControlState)state;
- (CGFloat)cornerRadiusForState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
