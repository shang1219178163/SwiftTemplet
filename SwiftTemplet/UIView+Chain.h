//
//  UIView+Chain.h
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/6.
//  Copyright © 2020 BN. All rights reserved.
//
/*
 方法的 swift 报错;
 添加前缀是为了防止和其他视图参数冲突
*/


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Chain)

/// 圆角半径 默认 0.0
@property(nonatomic, strong, readonly) UIView *(^nn_conrnerRadius)(CGFloat value);
/// 边框颜色 默认 black
@property(nonatomic, strong, readonly) UIView *(^nn_borderColor)(UIColor *value);
/// 边框宽度 默认 0.0
@property(nonatomic, strong, readonly) UIView *(^nn_borderWidth)(CGFloat value);
/// 阴影
/// 阴影颜色 默认 black
@property(nonatomic, strong, readonly) UIView *(^nn_shadowColor)(UIColor *value);
/// 阴影模糊度 默认 0.0
@property(nonatomic, strong, readonly) UIView *(^nn_shadowRadius)(CGFloat value);
/// (0~1] 默认 0.0
@property(nonatomic, strong, readonly) UIView *(^nn_shadowOpacity)(CGFloat value);
/// 阴影偏移方向和距离 默认 {0.0，0.0}
@property(nonatomic, strong, readonly) UIView *(^nn_shadowOffset)(CGSize value);
/// 图层
@property(nonatomic, strong, readonly) UIView *(^nn_zPosition)(CGFloat value);

@end

NS_ASSUME_NONNULL_END
