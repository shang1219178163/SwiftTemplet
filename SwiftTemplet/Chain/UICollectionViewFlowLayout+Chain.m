//
//	UICollectionViewFlowLayout+Chain.m
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/22 11:44
//	Copyright © 2021 Bin Shang. All rights reserved.
//



#import "UICollectionViewFlowLayout+Chain.h"

@implementation UICollectionViewFlowLayout (Chain)

- (UICollectionViewFlowLayout * (^)(CGFloat))minimumLineSpacingChain{
    return ^(CGFloat value) {
        self.minimumLineSpacing = value;
        return self;
    };
}

- (UICollectionViewFlowLayout * (^)(CGFloat))minimumInteritemSpacingChain{
    return ^(CGFloat value) {
        self.minimumInteritemSpacing = value;
        return self;
    };
}

- (UICollectionViewFlowLayout * (^)(CGSize))itemSizeChain{
    return ^(CGSize value) {
        self.itemSize = value;
        return self;
    };
}

- (UICollectionViewFlowLayout * (^)(CGSize))estimatedItemSizeChain{
    return ^(CGSize value) {
        self.estimatedItemSize = value;
        return self;
    };
}

- (UICollectionViewFlowLayout * (^)(UICollectionViewScrollDirection))scrollDirectionChain{
    return ^(UICollectionViewScrollDirection value) {
        self.scrollDirection = value;
        return self;
    };
}

- (UICollectionViewFlowLayout * (^)(CGSize))headerReferenceSizeChain{
    return ^(CGSize value) {
        self.headerReferenceSize = value;
        return self;
    };
}

- (UICollectionViewFlowLayout * (^)(CGSize))footerReferenceSizeChain{
    return ^(CGSize value) {
        self.footerReferenceSize = value;
        return self;
    };
}

- (UICollectionViewFlowLayout * (^)(UIEdgeInsets))sectionInsetChain{
    return ^(UIEdgeInsets value) {
        self.sectionInset = value;
        return self;
    };
}

- (UICollectionViewFlowLayout * (^)(UICollectionViewFlowLayoutSectionInsetReference))sectionInsetReferenceChain{
    return ^(UICollectionViewFlowLayoutSectionInsetReference value) {
        self.sectionInsetReference = value;
        return self;
    };
}

- (UICollectionViewFlowLayout * (^)(BOOL))sectionHeadersPinToVisibleBoundsChain{
    return ^(BOOL value) {
        self.sectionHeadersPinToVisibleBounds = value;
        return self;
    };
}

- (UICollectionViewFlowLayout * (^)(BOOL))sectionFootersPinToVisibleBoundsChain{
    return ^(BOOL value) {
        self.sectionFootersPinToVisibleBounds = value;
        return self;
    };
}

@end
