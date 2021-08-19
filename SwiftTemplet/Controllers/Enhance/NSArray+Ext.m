//
//  NSArray+Ext.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/2/22.
//  Copyright © 2021 BN. All rights reserved.
//

#import "NSArray+Ext.h"

@implementation NSArray (Ext)

- (NSArray *)flatModels:(NSString *)childKey {
    if (![self.firstObject isKindOfClass:[NSObject class]]) {
        return @[];
    }
    NSMutableArray *list = [NSMutableArray array];
    for (NSObject *model in self) {
        [list addObject:model];
        
        [self recursionModel:model list:list childKey:childKey];
    }
    return list;
}

- (void)recursionModel:(NSObject *)model list:(NSMutableArray *)list childKey:(NSString *)childKey{
    NSArray *children = [model valueForKey:childKey];
    if (!children) {
        return;
    }
    
    for (NSObject *model in children) {
        [list addObject:model];
        
        NSArray *children = [model valueForKey:childKey];
        if (!children) {
            continue;
        }
        [self recursionModel:model list:list childKey:childKey];
    }
}

@end
