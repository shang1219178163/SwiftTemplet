//
//  SectionFlowLayout.swift
//  SuperView
//
//  Created by L on 16/8/16.
//  Copyright © 2016年 c0ming. All rights reserved.
//

import UIKit

// SB = Section Background

//private let SectionBackground = "NNCollectionReusableView"

protocol NNCollectionViewDelegateFlowLayout: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, backgroundColorForSectionAt section: Int) -> UIColor
}

extension NNCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, backgroundColorForSectionAt section: Int) -> UIColor {
        return UIColor.clear
    }
}

private class NNCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    var backgroundColor = UIColor.white

    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! NNCollectionViewLayoutAttributes
        copy.backgroundColor = backgroundColor
        return copy
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let rhs = object as? NNCollectionViewLayoutAttributes else {
            return false
        }
        
        if !backgroundColor.isEqual(rhs.backgroundColor) {
            return false
        }
        return super.isEqual(object)
    }
}

private class NNCollectionReusableView: UICollectionReusableView {
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        guard let attr = layoutAttributes as? NNCollectionViewLayoutAttributes else {
            return
        }
        
        backgroundColor = attr.backgroundColor
    }
}

class NNCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    private var decorationViewAttrs: [UICollectionViewLayoutAttributes] = []
    
    // MARK: - Init
    override init() {
        super.init()
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    // MARK: - Setup
    
    func setup() {
        // 1、注册
        register(NNCollectionReusableView.classForCoder(), forDecorationViewOfKind: UICollectionView.sectionKindBackgroud)
    }
    
    // MARK: -
    
    override func prepare() {
        super.prepare()
        
        guard let numberOfSections = collectionView?.numberOfSections,
            let delegate = collectionView?.delegate as? NNCollectionViewDelegateFlowLayout
            else {
                return
        }
        
        decorationViewAttrs.removeAll()
        for section in 0..<numberOfSections {
            guard let numberOfItems = collectionView?.numberOfItems(inSection: section),
                numberOfItems > 0,
                let firstItem = layoutAttributesForItem(at: IndexPath(item: 0, section: section)),
                let lastItem = layoutAttributesForItem(at: IndexPath(item: numberOfItems - 1, section: section)) else {
                    continue
            }
            
            var sectionInset = self.sectionInset
            if let inset = delegate.collectionView?(collectionView!, layout: self, insetForSectionAt: section) {
                sectionInset = inset
            }
            
            var sectionFrame = firstItem.frame.union(lastItem.frame)
            sectionFrame.origin.x = 0
            sectionFrame.origin.y -= sectionInset.top
            
            if scrollDirection == .horizontal {
                sectionFrame.size.width += sectionInset.left + sectionInset.right
                sectionFrame.size.height = collectionView!.frame.height
            } else {
                sectionFrame.size.width = collectionView!.frame.width
                sectionFrame.size.height += sectionInset.top + sectionInset.bottom
            }
            
            // 2、定义
            let attr = NNCollectionViewLayoutAttributes(forDecorationViewOfKind: UICollectionView.sectionKindBackgroud, with: IndexPath(item: 0, section: section))
            attr.frame = sectionFrame
            attr.zIndex = -1
            attr.backgroundColor = delegate.collectionView(collectionView!, layout: self, backgroundColorForSectionAt: section)
            
            decorationViewAttrs.append(attr)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attrs = super.layoutAttributesForElements(in: rect)
        attrs?.append(contentsOf: decorationViewAttrs.filter {
            return rect.intersects($0.frame)
        })
        return attrs // 3、返回
    }

    override func layoutAttributesForDecorationView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if elementKind == UICollectionView.sectionKindBackgroud {
            return decorationViewAttrs[indexPath.section]
        }
        return super.layoutAttributesForDecorationView(ofKind: elementKind, at: indexPath)
    }
}



extension UICollectionView{
    static let sectionKindBackgroud: String = "UICollectionView.sectiinKindBackgroud";

}
