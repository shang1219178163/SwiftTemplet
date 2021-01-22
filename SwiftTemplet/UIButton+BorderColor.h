//
//  UIButton+BorderColor.h
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/1/22.
//  Copyright © 2021 BN. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (BorderColor)

- (void)setBorderColor:(nullable UIColor *)color forState:(UIControlState)state;
- (nullable UIColor *)borderColorForState:(UIControlState)state;

- (void)setBorderWidth:(CGFloat)value forState:(UIControlState)state;
- (CGFloat)borderWidthForState:(UIControlState)state;
    
- (void)setCornerRadius:(CGFloat)value forState:(UIControlState)state;
- (CGFloat)cornerRadiusForState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
