//
//    UICollectionViewFlowLayout+Chain.h
//    MacTemplet
//
//    Created by Bin Shang on 2021/04/22 16:41
//    Copyright © 2021 Bin Shang. All rights reserved.
//



public extension UICollectionViewFlowLayout {

    func minimumLineSpacing(_ minimumLineSpacing: CGFloat) -> Self {
        self.minimumLineSpacing = minimumLineSpacing
        return self
    }

    func minimumInteritemSpacing(_ minimumInteritemSpacing: CGFloat) -> Self {
        self.minimumInteritemSpacing = minimumInteritemSpacing
        return self
    }

    func itemSize(_ itemSize: CGSize) -> Self {
        self.itemSize = itemSize
        return self
    }

    // defaults to CGSizeZero - setting a non-zero size enables cells that self-size via -preferredLayoutAttributesFittingAttributes:
    @available(iOS 8.0, *)
    func estimatedItemSize(_ estimatedItemSize: CGSize) -> Self {
        self.estimatedItemSize = estimatedItemSize
        return self
    }

    // default is UICollectionViewScrollDirectionVertical
    func scrollDirection(_ scrollDirection: UICollectionView.ScrollDirection) -> Self {
        self.scrollDirection = scrollDirection
        return self
    }

    func headerReferenceSize(_ headerReferenceSize: CGSize) -> Self {
        self.headerReferenceSize = headerReferenceSize
        return self
    }

    func footerReferenceSize(_ footerReferenceSize: CGSize) -> Self {
        self.footerReferenceSize = footerReferenceSize
        return self
    }

    func sectionInset(_ sectionInset: UIEdgeInsets) -> Self {
        self.sectionInset = sectionInset
        return self
    }

    @available(iOS 11.0, *)
    func sectionInsetReference(_ sectionInsetReference: UICollectionViewFlowLayout.SectionInsetReference) -> Self {
        self.sectionInsetReference = sectionInsetReference
        return self
    }

    @available(iOS 9.0, *)
    func sectionHeadersPinToVisibleBounds(_ sectionHeadersPinToVisibleBounds: Bool) -> Self {
        self.sectionHeadersPinToVisibleBounds = sectionHeadersPinToVisibleBounds
        return self
    }

    @available(iOS 9.0, *)
    func sectionFootersPinToVisibleBounds(_ sectionFootersPinToVisibleBounds: Bool) -> Self {
        self.sectionFootersPinToVisibleBounds = sectionFootersPinToVisibleBounds
        return self
    }
    
}
