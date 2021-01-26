//
//  Calculator+Chain.h
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/6.
//  Copyright © 2020 BN. All rights reserved.
//

#import "Calculator.h"

NS_ASSUME_NONNULL_BEGIN

@interface Calculator (Chain)

+ (CGFloat)nn_makeCalcuclate:(void(^)(Calculator *))block;

@end

NS_ASSUME_NONNULL_END
