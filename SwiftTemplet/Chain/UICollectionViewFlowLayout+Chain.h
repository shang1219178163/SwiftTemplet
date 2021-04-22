//
//	UICollectionViewFlowLayout+Chain.h
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/22 11:44
//	Copyright © 2021 Bin Shang. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewFlowLayout (Chain)

@property(nonatomic, copy, readonly) UICollectionViewFlowLayout *(^minimumLineSpacingChain)(CGFloat);

@property(nonatomic, copy, readonly) UICollectionViewFlowLayout *(^minimumInteritemSpacingChain)(CGFloat);

@property(nonatomic, copy, readonly) UICollectionViewFlowLayout *(^itemSizeChain)(CGSize);

@property(nonatomic, copy, readonly) UICollectionViewFlowLayout *(^estimatedItemSizeChain)(CGSize) API_AVAILABLE(ios(8.0));; // defaults to CGSizeZero - setting a non-zero size enables cells that self-size via -preferredLayoutAttributesFittingAttributes:
@property(nonatomic, copy, readonly) UICollectionViewFlowLayout *(^scrollDirectionChain)(UICollectionViewScrollDirection);
 // default is UICollectionViewScrollDirectionVertical
@property(nonatomic, copy, readonly) UICollectionViewFlowLayout *(^headerReferenceSizeChain)(CGSize);

@property(nonatomic, copy, readonly) UICollectionViewFlowLayout *(^footerReferenceSizeChain)(CGSize);

@property(nonatomic, copy, readonly) UICollectionViewFlowLayout *(^sectionInsetChain)(UIEdgeInsets);

@property(nonatomic, copy, readonly) UICollectionViewFlowLayout *(^sectionInsetReferenceChain)(UICollectionViewFlowLayoutSectionInsetReference) API_AVAILABLE(ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos);
@property(nonatomic, copy, readonly) UICollectionViewFlowLayout *(^sectionHeadersPinToVisibleBoundsChain)(BOOL) API_AVAILABLE(ios(9.0));
@property(nonatomic, copy, readonly) UICollectionViewFlowLayout *(^sectionFootersPinToVisibleBoundsChain)(BOOL) API_AVAILABLE(ios(9.0));


@end

NS_ASSUME_NONNULL_END
