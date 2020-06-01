//
//  NNMutiSectionFlowLayout.swift
//  gymbo
//
//  Created by drogan Zheng on 2020/5/7.
//  Copyright © 2020 Gymbo.co. All rights reserved.
//  https://github.com/RoganZheng/WaterfallMultiSectionFlowLayout
//

import UIKit

@objc protocol NNMultipleSectionFlowLayoutDelegate: NSObjectProtocol {
    /// collectionItem高度
    @objc optional func heightForItemAtIndexPath(_ collectionView: UICollectionView, layout: NNMultipleSectionFlowLayout, indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat
    /// 每个section 列数（默认2列）
    @objc optional func columnCount(_ collectionView: UICollectionView, layout: NNMultipleSectionFlowLayout, section: Int) -> Int
}

@objc class NNMultipleSectionFlowLayout: UICollectionViewFlowLayout {
    
    weak var delegate: NNMultipleSectionFlowLayoutDelegate?
    /// 每个section 列数（默认2列）
    private var columnCount: Int = 2
    private var itemHeight: CGFloat = 200

    //存放attribute的数组
    private var attrArray: [UICollectionViewLayoutAttributes] = []
    
//    var contentSize: CGSize = .zero
    
    //存放每个section中各个列的最后一个高度
    private var columnHeights: [CGFloat] = []
    //collectionView的Content的高度
    private var contentHeight: CGFloat = 0
    //记录上个section高度最高一列的高度
    private var lastContentHeight: CGFloat = 0
    
    override func prepare() {
        super.prepare()
        contentHeight = 0
        lastContentHeight = 0
        columnHeights.removeAll()
        attrArray.removeAll()
    
        guard let collectionView = collectionView, collectionView.numberOfSections > 0 else { return }
        let numberOfSections = collectionView.numberOfSections
        // 遍历section
        for section in 0..<numberOfSections {
            let indexPath = IndexPath(item: 0, section: section)
            if let count = delegate?.columnCount?(collectionView, layout: self, section: indexPath.section) {
                columnCount = count
            }

            if let headerAttr = layoutAttributesForSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, at: indexPath){
                attrArray.append(headerAttr)
                columnHeights.removeAll()
            }
            
            lastContentHeight = contentHeight
            // 初始化区 y值
            for _ in 0..<columnCount {
                columnHeights.append(contentHeight)
            }
            // 多少个item
            let itemCount = collectionView.numberOfItems(inSection: section)
            for item in 0..<itemCount {
                let indexP = IndexPath(item: item, section: section)
                if let attr = layoutAttributesForItem(at: indexP) {
                    attrArray.append(attr)
                }
            }
          
            // 初始化footer
            if let footerAttr = layoutAttributesForSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, at: indexPath){
                attrArray.append(footerAttr)
            }
        }
    }
  
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attrArray
    }
  
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        refreshValueFromDelegate(indexPath)

        if let column = delegate?.columnCount?(collectionView!, layout: self, section: indexPath.section) {
            columnCount = column
        }
        
        let attr = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        let allWidth = collectionView!.frame.size.width - sectionInset.left - sectionInset.right - CGFloat(columnCount - 1) * minimumInteritemSpacing
        let itemWidth = allWidth / CGFloat(columnCount)
        if let height = delegate?.heightForItemAtIndexPath?(collectionView!, layout: self, indexPath: indexPath, itemWidth: itemWidth) {
            itemHeight = height
        }
        var tmpMinColumn = 0
        var minColumnHeight = columnHeights[0]
        for i in 0..<columnCount {
            let columnH = columnHeights[i]
            if minColumnHeight > columnH {
                minColumnHeight = columnH
                tmpMinColumn = i
//                print("\(#function)_\(indexPath.section)_\(i)_\(minColumnHeight)_\(columnH)_\(tmpMinColumn)")
            }
        }
        let cellX: CGFloat = sectionInset.left + CGFloat(tmpMinColumn) * (itemWidth + minimumInteritemSpacing)
        var cellY: CGFloat = minColumnHeight
        if cellY != lastContentHeight {
            cellY += minimumLineSpacing
        }
    
        if contentHeight < minColumnHeight {
            contentHeight = minColumnHeight
        }
    
        attr.frame = CGRect(x: cellX, y: cellY, width: itemWidth, height: itemHeight)
        columnHeights[tmpMinColumn] = attr.frame.maxY
        //取最大的section 中 maxY 最大值
        contentHeight = columnHeights.max()!
//        print("\(#function):{\(indexPath.section),\(indexPath.row)}_\(contentHeight)_\(columnHeights)")
        return attr
    }
    
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        refreshValueFromDelegate(indexPath)
                
        let attr = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: elementKind, with: indexPath)
        if elementKind == UICollectionView.elementKindSectionHeader {
            attr.frame = CGRect(x: 0, y: contentHeight, width: headerReferenceSize.width, height: headerReferenceSize.height)
            contentHeight += headerReferenceSize.height
            contentHeight += sectionInset.top
        } else if elementKind == UICollectionView.elementKindSectionFooter {
            contentHeight += sectionInset.bottom
            attr.frame = CGRect(x: 0, y: contentHeight, width: footerReferenceSize.width, height: footerReferenceSize.height)
            contentHeight += footerReferenceSize.height
        }
        return attr
    }
  
    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView!.frame.size.width, height: attrArray.last!.frame.maxY)
    }
    // MARK: -funtions

}

extension UICollectionViewFlowLayout{
    ///获取代理方法里的布局基础属性值
    func refreshValueFromDelegate(_ indexPath: IndexPath) {
        if let collectionView = collectionView, let delegate = collectionView.delegate {
            if delegate.conforms(to: UICollectionViewDelegateFlowLayout.self) == true {
                if let flowDelegate: UICollectionViewDelegateFlowLayout = delegate as? UICollectionViewDelegateFlowLayout{
                    if let value = flowDelegate.collectionView?(collectionView, layout: self, minimumLineSpacingForSectionAt: indexPath.section) as CGFloat? {
                        minimumLineSpacing = value
                    }
                    
                    if let inset = flowDelegate.collectionView?(collectionView, layout: self, minimumInteritemSpacingForSectionAt: indexPath.section) as CGFloat? {
                        minimumInteritemSpacing = inset
                    }
                    
                    if let inset = flowDelegate.collectionView?(collectionView, layout: self, insetForSectionAt: indexPath.section) as UIEdgeInsets? {
                        sectionInset = inset
                    }
                    
                    if let size = flowDelegate.collectionView?(collectionView, layout: self, referenceSizeForHeaderInSection: indexPath.section) as CGSize? {
                        headerReferenceSize = size
                    }
                    
                    if let size = flowDelegate.collectionView?(collectionView, layout: self, referenceSizeForFooterInSection: indexPath.section) as CGSize? {
                        footerReferenceSize = size
                    }
                }
            }
        }
    }
}
