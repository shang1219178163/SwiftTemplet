//
//  Calculator.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/6.
//  Copyright © 2020 BN. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

-(instancetype)init{
    if (self = [super init]) {
        self.result = 0;
    }
    return self;
}

-(Calculator *(^)(CGFloat))add{
    return ^(CGFloat value){
        self.result += value;
        return self;
    };
}

-(Calculator *(^)(CGFloat))sub{
    return ^(CGFloat value){
        self.result -= value;
        return self;
    };
}

- (Calculator * _Nonnull (^)(CGFloat))multiply{
    return ^(CGFloat value){
        self.result *= value;
        return self;
    };
}

- (Calculator * _Nonnull (^)(CGFloat))divide{
    return ^(CGFloat value){
        self.result /= value;
        return self;
    };
}

-(Calculator *)clear{
    self.result = 0;
    return self;
}

-(Calculator *)print{
    NSLog(@"计算结果: %@\n", @(self.result));
//    NSLog(@"计算结果:%.2f\n", self.result);
    return self;
}

@end
