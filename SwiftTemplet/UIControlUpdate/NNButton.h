//
//  NNButton.h
//  ProductTemplet
//
//  Created by Bin Shang on 2021/1/21.
//  Copyright © 2021 BN. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, NNButtonDirection) {
    NNButtonDirectionNone,
    NNButtonDirectionTop,
    NNButtonDirectionLeft,
    NNButtonDirectionBom,
    NNButtonDirectionRight
};

typedef NS_ENUM(NSUInteger, NNButtonLocation) {
    NNButtonLocationNone,
    NNButtonLocationLeftTop,
    NNButtonLocationLeftBom,
    NNButtonLocationRightTop,
    NNButtonLocationRightBom,
};

@interface NNButton : UIButton

@property (nonatomic, strong) UIButton *iconBtn;
@property (nonatomic, assign) NNButtonDirection direction;
@property (nonatomic, assign) NNButtonLocation iconLocation;

@property (nonatomic, assign) CGSize iconSize;
@property (nonatomic, assign) UIOffset iconOffset;
@property (nonatomic, assign) CGFloat eventInsetDX;
@property (nonatomic, assign) CGFloat eventInsetDY;
@property (nonatomic, assign) CGFloat labelHeight;
@property (nonatomic, assign) CGFloat spacing;

@end

NS_ASSUME_NONNULL_END
