//
//  NSArray+Ext.h
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/2/22.
//  Copyright © 2021 BN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Ext)

/// 嵌套模型数组扁平化
/// @param childKey 例如 children, child, son
- (NSArray *)flatModels:(NSString *)childKey;

@end

NS_ASSUME_NONNULL_END
