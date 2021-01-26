//
//  Calculator+Chain.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/6.
//  Copyright © 2020 BN. All rights reserved.
//

#import "Calculator+Chain.h"

@implementation Calculator (Chain)

+ (CGFloat)nn_makeCalcuclate:(void(^)(Calculator *))block{
    Calculator *manager = [[Calculator alloc] init];
    block(manager);
    return manager.result;
}

@end
