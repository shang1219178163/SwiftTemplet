//
//  UIButton+BorderColor.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/1/22.
//  Copyright © 2021 BN. All rights reserved.
//

#import "UIButton+BorderColor.h"
#import <objc/runtime.h>

@interface NNBorderTarget : NSObject

@property (nonatomic, weak) UIButton *button;

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
}

#pragma mark -observe
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([object isKindOfClass:[UIButton class]]) {
//        UIButton *sender = (UIButton *)object;
        if ([keyPath isEqualToString:@"selected"] || [keyPath isEqualToString:@"highlighted"]) {
            [self changeLayerBorderColor];
            [self changeLayerBorderWidth];
            [self changeLayerCornerRadius];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


#pragma mark -set,get
- (NSMutableDictionary<NSNumber *, UIColor *> *)borderColorDic{
    id obj = objc_getAssociatedObject(self, _cmd);
    if (obj) {
        return obj;
    }
    
    NSMutableDictionary *mdic = @{}.mutableCopy;
    
    objc_setAssociatedObject(self, _cmd, mdic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return mdic;
}

- (NSMutableDictionary<NSNumber *, NSNumber *> *)borderWidthDic{
    id obj = objc_getAssociatedObject(self, _cmd);
    if (obj) {
        return obj;
    }
    
    NSMutableDictionary *mdic = @{}.mutableCopy;
    
    objc_setAssociatedObject(self, _cmd, mdic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return mdic;
}

- (NSMutableDictionary<NSNumber *, NSNumber *> *)cornerRadiusDic{
    id obj = objc_getAssociatedObject(self, _cmd);
    if (obj) {
        return obj;
    }
    
    NSMutableDictionary *mdic = @{}.mutableCopy;
    
    objc_setAssociatedObject(self, _cmd, mdic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return mdic;
}


#pragma mark -public

- (void)setBorderColor:(nullable UIColor *)color forState:(UIControlState)state{
    if (!color) {
        return;
    }
    self.borderColorDic[@(state)] = color;
    [self changeLayerBorderColor];
}

- (nullable UIColor *)borderColorForState:(UIControlState)state{
    return self.borderColorDic[@(state)];
}

- (void)setBorderWidth:(CGFloat)value forState:(UIControlState)state{
    self.borderWidthDic[@(state)] = @(value);
    [self changeLayerBorderWidth];
}

- (CGFloat)borderWidthForState:(UIControlState)state{
    return self.borderWidthDic[@(state)].floatValue;
}

- (void)setCornerRadius:(CGFloat)value forState:(UIControlState)state{
    self.cornerRadiusDic[@(state)] = @(value);
    [self changeLayerCornerRadius];
}

- (CGFloat)cornerRadiusForState:(UIControlState)state{
    return self.cornerRadiusDic[@(state)].floatValue;
}

#pragma mark -private
- (void)changeLayerBorderColor{
    UIColor *normalColor = self.borderColorDic[@(UIControlStateNormal)];
    if (!normalColor) {
        return;
    }

    UIColor *color = self.borderColorDic[@(self.button.state)] ? : normalColor;
    self.button.layer.borderColor = color.CGColor;
    
    if (self.button.layer.borderWidth == 0) {
        self.button.layer.borderWidth = 1;
    }
}

- (void)changeLayerBorderWidth{
    NSNumber *normalValue = self.borderWidthDic[@(UIControlStateNormal)];
    if (!normalValue) {
        return;
    }
    
    NSNumber *numer = self.borderWidthDic[@(self.button.state)] ? : normalValue;
    self.button.layer.borderWidth = numer.floatValue;
    
    if (self.button.layer.borderWidth == 0) {
        self.button.layer.borderWidth = 1;
    }
}

- (void)changeLayerCornerRadius{
    NSNumber *normalValue = self.cornerRadiusDic[@(UIControlStateNormal)];
    if (!normalValue) {
        return;
    }
    
    NSNumber *numer = self.cornerRadiusDic[@(self.button.state)] ? : normalValue;
    self.button.layer.cornerRadius = numer.floatValue;
    
    if (self.button.layer.borderWidth == 0) {
        self.button.layer.borderWidth = 1;
    }
}

@end


@interface UIButton()

@property (nonatomic, strong, readwrite) NSMutableDictionary<NSNumber *, UIColor *> *borderColorDic;
@property (nonatomic, strong, readwrite) NSMutableDictionary<NSNumber *, NSNumber *> *borderWidthDic;
@property (nonatomic, strong, readwrite) NSMutableDictionary<NSNumber *, NSNumber *> *cornerRadiusDic;

@end

@implementation UIButton (BorderColor)

- (NNBorderTarget *)borderTarget{
    id obj = objc_getAssociatedObject(self, _cmd);
    if (obj) {
        return obj;
    }
    NNBorderTarget *tmp = [[NNBorderTarget alloc]init];
    tmp.button = self;
    
    [tmp.button addObserver:tmp forKeyPath:@"selected" options:NSKeyValueObservingOptionNew context:nil];
    [tmp.button addObserver:tmp forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:nil];

    objc_setAssociatedObject(self, @selector(borderTarget), tmp, OBJC_ASSOCIATION_RETAIN);
    return tmp;
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
