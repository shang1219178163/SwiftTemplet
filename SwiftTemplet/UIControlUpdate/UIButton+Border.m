//
//  UIButton+Border.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/1/22.
//  Copyright © 2021 BN. All rights reserved.
//

#import "UIButton+Border.h"
#import <objc/runtime.h>

@interface NNBorderTarget : NSObject

@property (nonatomic, weak) UIButton *button;

@property (nonatomic, strong) NSMutableDictionary<NSNumber *, UIColor *> *borderColorDic;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, NSNumber *> *borderWidthDic;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, NSNumber *> *cornerRadiusDic;

- (void)setBorderColor:(nullable UIColor *)color forState:(UIControlState)state;
- (nullable UIColor *)borderColorForState:(UIControlState)state;

- (void)setBorderWidth:(CGFloat)value forState:(UIControlState)state;
- (CGFloat)borderWidthForState:(UIControlState)state;
    
- (void)setCornerRadius:(CGFloat)value forState:(UIControlState)state;
- (CGFloat)cornerRadiusForState:(UIControlState)state;

@end


@implementation NNBorderTarget

- (void)dealloc{
    [self.button removeObserver:self forKeyPath:@"selected"];
    [self.button removeObserver:self forKeyPath:@"highlighted"];
    [self.button removeObserver:self forKeyPath:@"enabled"];
}

#pragma mark -observe
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([object isKindOfClass:[UIButton class]]) {
        UIButton *sender = (UIButton *)object;
        if ([keyPath isEqualToString:@"selected"] || [keyPath isEqualToString:@"highlighted"] || [keyPath isEqualToString:@"enabled"]) {
            [self changeLayerBorderColor: sender];
            [self changeLayerBorderWidth: sender];
            [self changeLayerCornerRadius: sender];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


#pragma mark -set,get
- (NSMutableDictionary<NSNumber *,UIColor *> *)borderColorDic{
    if (!_borderColorDic) {
        _borderColorDic = @{
            @(0): UIColor.darkGrayColor,
            @(1): UIColor.systemBlueColor,
            
        }.mutableCopy;
    }
    return _borderColorDic;
}

- (NSMutableDictionary<NSNumber *, NSNumber *> *)borderWidthDic{
    if (!_borderWidthDic) {
        _borderWidthDic = @{
            @(0): @(1),
            @(1): @(1),
            
        }.mutableCopy;
    }
    return _borderWidthDic;
}

- (NSMutableDictionary<NSNumber *, NSNumber *> *)cornerRadiusDic{
    if (!_cornerRadiusDic) {
        _cornerRadiusDic = @{
            @(0): @(4),
            @(1): @(4),
            
        }.mutableCopy;
    }
    return _cornerRadiusDic;
}

//- (NSMutableDictionary<NSNumber *, UIColor *> *)borderColorDic{
//    id obj = objc_getAssociatedObject(self, _cmd);
//    if (obj) {
//        return obj;
//    }
//
//    NSMutableDictionary *mdic = @{}.mutableCopy;
//
//    objc_setAssociatedObject(self, _cmd, mdic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    return mdic;
//}
//
//- (NSMutableDictionary<NSNumber *, NSNumber *> *)borderWidthDic{
//    id obj = objc_getAssociatedObject(self, _cmd);
//    if (obj) {
//        return obj;
//    }
//
//    NSMutableDictionary *mdic = @{}.mutableCopy;
//
//    objc_setAssociatedObject(self, _cmd, mdic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    return mdic;
//}
//
//- (NSMutableDictionary<NSNumber *, NSNumber *> *)cornerRadiusDic{
//    id obj = objc_getAssociatedObject(self, _cmd);
//    if (obj) {
//        return obj;
//    }
//
//    NSMutableDictionary *mdic = @{}.mutableCopy;
//
//    objc_setAssociatedObject(self, _cmd, mdic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    return mdic;
//}


#pragma mark -public

- (void)setBorderColor:(nullable UIColor *)color forState:(UIControlState)state{
    if (!color) {
        return;
    }
    self.borderColorDic[@(state)] = color;
    [self changeLayerBorderColor: self.button];
}

- (nullable UIColor *)borderColorForState:(UIControlState)state{
    return self.borderColorDic[@(state)];
}

- (void)setBorderWidth:(CGFloat)value forState:(UIControlState)state{
    self.borderWidthDic[@(state)] = @(value);
    [self changeLayerBorderWidth: self.button];
}

- (CGFloat)borderWidthForState:(UIControlState)state{
    return self.borderWidthDic[@(state)].floatValue;
}

- (void)setCornerRadius:(CGFloat)value forState:(UIControlState)state{
    self.cornerRadiusDic[@(state)] = @(value);
    [self changeLayerCornerRadius: self.button];
}

- (CGFloat)cornerRadiusForState:(UIControlState)state{
    return self.cornerRadiusDic[@(state)].floatValue;
}

#pragma mark -private
- (void)changeLayerBorderColor:(UIButton *)sender{
    UIColor *normalColor = self.borderColorDic[@(UIControlStateNormal)];
    if (!normalColor) {
        return;
    }

    UIColor *color = self.borderColorDic[@(sender.state)] ? : normalColor;
    sender.layer.borderColor = color.CGColor;
    
    if (sender.layer.borderWidth == 0) {
        sender.layer.borderWidth = 1;
    }
}

- (void)changeLayerBorderWidth:(UIButton *)sender{
    NSNumber *normalValue = self.borderWidthDic[@(UIControlStateNormal)];
    if (!normalValue) {
        return;
    }
    
    NSNumber *numer = self.borderWidthDic[@(sender.state)] ? : normalValue;
    sender.layer.borderWidth = numer.floatValue;
    
    if (sender.layer.borderWidth == 0) {
        sender.layer.borderWidth = 1;
    }
}

- (void)changeLayerCornerRadius:(UIButton *)sender{
    NSNumber *normalValue = self.cornerRadiusDic[@(UIControlStateNormal)];
    if (!normalValue) {
        return;
    }
    
    NSNumber *numer = self.cornerRadiusDic[@(sender.state)] ? : normalValue;
    sender.layer.cornerRadius = numer.floatValue;
    
    if (sender.layer.borderWidth == 0) {
        sender.layer.borderWidth = 1;
    }
}

@end



@implementation UIButton (Border)

- (NNBorderTarget *)borderTarget{
    id obj = objc_getAssociatedObject(self, _cmd);
    if (obj) {
        return obj;
    }
    NNBorderTarget *target = [[NNBorderTarget alloc]init];
    target.button = self;
    
    [target.button addObserver:target forKeyPath:@"selected" options:NSKeyValueObservingOptionNew context:nil];
    [target.button addObserver:target forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:nil];
    [target.button addObserver:target forKeyPath:@"enabled" options:NSKeyValueObservingOptionNew context:nil];

    objc_setAssociatedObject(self, @selector(borderTarget), target, OBJC_ASSOCIATION_RETAIN);
    return target;
}

- (void)setBorderColor:(nullable UIColor *)color forState:(UIControlState)state{
    [self.borderTarget setBorderColor:color forState:state];
}

- (nullable UIColor *)borderColorForState:(UIControlState)state{
    return [self.borderTarget borderColorForState:state];
}

- (void)setBorderWidth:(CGFloat)value forState:(UIControlState)state{
    [self.borderTarget setBorderWidth:value forState:state];
}

- (CGFloat)borderWidthForState:(UIControlState)state{
    return [self.borderTarget borderWidthForState:state];
}

- (void)setCornerRadius:(CGFloat)value forState:(UIControlState)state{
    [self.borderTarget setCornerRadius:value forState:state];
}

- (CGFloat)cornerRadiusForState:(UIControlState)state{
    return [self.borderTarget cornerRadiusForState:state];
}

@end
