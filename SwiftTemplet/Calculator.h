//
//  Calculator.h
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/6.
//  Copyright © 2020 BN. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Calculator : NSObject
//计算结果
@property(nonatomic, assign) CGFloat result;
///在结果上加
@property(nonatomic, strong, readonly) Calculator *(^add)(CGFloat);
///在结果上减
@property(nonatomic, strong, readonly) Calculator *(^sub)(CGFloat);
///在结果上乘
@property(nonatomic, strong, readonly) Calculator *(^multiply)(CGFloat);
///在结果上除
@property(nonatomic, strong, readonly) Calculator *(^divide)(CGFloat);

///清零
-(Calculator *)clear;
///打印结果
-(Calculator *)print;

@end

NS_ASSUME_NONNULL_END
