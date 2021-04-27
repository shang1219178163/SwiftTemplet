//
//  UIView+Chain.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/6.
//  Copyright © 2020 BN. All rights reserved.
//

#import "UIView+Chain.h"

@implementation UIView (Chain)

- (UIView * (^)(CGFloat))conrnerRadiusChain{
    return ^(CGFloat value) {
        self.layer.cornerRadius = value;
        return self;
    };
}

- (UIView * (^)(UIColor * _Nonnull))borderColorChain{
    return ^(UIColor *value) {
        self.layer.borderColor = value.CGColor;
        return self;
    };
}

- (UIView * (^)(CGFloat))borderWidthChain{
    return ^(CGFloat value) {
        self.layer.borderWidth = value;
        return self;
    };
}

- (UIView * (^)(UIColor * _Nonnull, CGFloat, CGFloat, CGSize))shadowChain{
    return ^(UIColor *color, CGFloat radius, CGFloat opacity, CGSize offset) {
        self.layer.shadowColor = color.CGColor;
        self.layer.shadowRadius = radius;
        self.layer.shadowOpacity = opacity;
        self.layer.shadowOffset = offset;
        return self;
    };
}

- (UIView * (^)(CGFloat))zPositionChain{
    return ^(CGFloat value) {
        self.layer.zPosition = value;
        return self;
    };
}


@end

