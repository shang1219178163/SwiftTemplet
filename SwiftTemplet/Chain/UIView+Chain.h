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
@property(nonatomic, strong, readonly) UIView *(^conrnerRadiusChain)(CGFloat value);
/// 边框颜色 默认 black
@property(nonatomic, strong, readonly) UIView *(^borderColorChain)(UIColor *value);
/// 边框宽度 默认 0.0
@property(nonatomic, strong, readonly) UIView *(^borderWidthChain)(CGFloat value);
/// 阴影(颜色 默认 black, 半径, 模糊度 (0~1] 默认 0.0, 偏移方向和距离 默认 {0.0，0.0})
@property(nonatomic, strong, readonly) UIView *(^shadowChain)(UIColor *color, CGFloat radius, CGFloat opacity, CGSize offset);
/// 图层
@property(nonatomic, strong, readonly) UIView *(^zPositionChain)(CGFloat value);




@end

NS_ASSUME_NONNULL_END
