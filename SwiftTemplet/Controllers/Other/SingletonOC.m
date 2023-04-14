//
//  SingletonOC.m
//  SwiftTemplet
//
//  Created by shangbinbin on 2023/4/11.
//  Copyright © 2023 BN. All rights reserved.
//

#import "SingletonOC.h"

static SingletonOC *_instance = nil;

@implementation SingletonOC

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}



@end
