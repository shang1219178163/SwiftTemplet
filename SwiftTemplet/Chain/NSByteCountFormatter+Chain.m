//
//	NSByteCountFormatter+Chain.m
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/22 11:11
//	Copyright © 2021 Bin Shang. All rights reserved.
//



#import "NSByteCountFormatter+Chain.h"

@implementation NSByteCountFormatter (Chain)

- (NSByteCountFormatter * (^)(NSByteCountFormatterUnits))allowedUnitsChain{
    return ^(NSByteCountFormatterUnits value) {
        self.allowedUnits = value;
        return self;
    };
}

- (NSByteCountFormatter * (^)(NSByteCountFormatterCountStyle))countStyleChain{
    return ^(NSByteCountFormatterCountStyle value) {
        self.countStyle = value;
        return self;
    };
}

- (NSByteCountFormatter * (^)(BOOL))allowsNonnumericFormattingChain{
    return ^(BOOL value) {
        self.allowsNonnumericFormatting = value;
        return self;
    };
}

- (NSByteCountFormatter * (^)(BOOL))includesUnitChain{
    return ^(BOOL value) {
        self.includesUnit = value;
        return self;
    };
}

- (NSByteCountFormatter * (^)(BOOL))includesCountChain{
    return ^(BOOL value) {
        self.includesCount = value;
        return self;
    };
}

- (NSByteCountFormatter * (^)(BOOL))includesActualByteCountChain{
    return ^(BOOL value) {
        self.includesActualByteCount = value;
        return self;
    };
}

- (NSByteCountFormatter * (^)(BOOL))adaptiveChain{
    return ^(BOOL value) {
        self.adaptive = value;
        return self;
    };
}

- (NSByteCountFormatter * (^)(BOOL))zeroPadsFractionDigitsChain{
    return ^(BOOL value) {
        self.zeroPadsFractionDigits = value;
        return self;
    };
}




@end
