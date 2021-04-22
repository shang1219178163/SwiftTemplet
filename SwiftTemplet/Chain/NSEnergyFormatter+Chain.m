//
//	NSEnergyFormatter+Chain.m
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/19 13:56
//	Copyright © 2021 Bin Shang. All rights reserved.
//



#import "NSEnergyFormatter+Chain.h"

@implementation NSEnergyFormatter (Chain)

- (NSEnergyFormatter * (^)(NSNumberFormatter *))numberFormatterChain{
    return ^(NSNumberFormatter * value) {
        self.numberFormatter = value;
        return self;
    };
}

- (NSEnergyFormatter * (^)(NSFormattingUnitStyle))unitStyleChain{
    return ^(NSFormattingUnitStyle value) {
        self.unitStyle = value;
        return self;
    };
}

- (NSEnergyFormatter * (^)(BOOL))forFoodEnergyUseChain{
    return ^(BOOL value) {
        self.forFoodEnergyUse = value;
        return self;
    };
}



@end
