//
//  UIView+Chain.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/6.
//  Copyright © 2020 BN. All rights reserved.
//

#import "UIView+Chain.h"

@implementation UIView (Chain)

- (UIView * _Nonnull (^)(CGFloat))nn_conrnerRadius{
    return ^(CGFloat value){
        self.layer.cornerRadius = value;
        return self;
    };
}

- (UIView * _Nonnull (^)(UIColor * _Nonnull))nn_borderColor{
    return ^(UIColor *value){
        self.layer.borderColor = value.CGColor;
        return self;
    };
}

- (UIView * _Nonnull (^)(CGFloat))nn_borderWidth{
    return ^(CGFloat value){
        self.layer.borderWidth = value;
        return self;
    };
}

- (UIView * _Nonnull (^)(UIColor * _Nonnull))nn_shadowColor{
    return ^(UIColor *value){
        self.layer.shadowColor = value.CGColor;
        return self;
    };
}

- (UIView * _Nonnull (^)(CGFloat))nn_shadowOpacity{
    return ^(CGFloat value) {
        self.layer.shadowOpacity = value;
        return self;
    };
}

- (UIView * _Nonnull (^)(CGFloat))nn_shadowRadius{
    return ^(CGFloat value) {
        self.layer.shadowRadius = value;
        return self;
    };
}

- (UIView * _Nonnull (^)(CGSize))nn_shadowOffset{
    return ^(CGSize value) {
        self.layer.shadowOffset = value;
        return self;
    };
}

- (UIView * _Nonnull (^)(CGFloat))nn_zPosition{
    return ^(CGFloat value){
        self.layer.zPosition = value;
        return self;
    };
}


@end

