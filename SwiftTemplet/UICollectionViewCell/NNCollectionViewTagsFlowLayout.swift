//
//  NNCollectionViewTagsFlowLayout.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/16.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit


@objc protocol NNCollectionViewTagsFlowLayoutDelegate {
    @objc func collectionView(_ collectionView:UICollectionView, itemSizeAt indexPath:NSIndexPath) -> CGSize
}


@objcMembers class NNCollectionViewTagsFlowLayout: UICollectionViewFlowLayout {
    
    var delegate: NNCollectionViewTagsFlowLayoutDelegate?
    
    private var itemAttributesCache: Array<UICollectionViewLayoutAttributes> = []
    private var contentSize: CGSize = CGSize.zero
    
    override var collectionViewContentSize: CGSize {
        return contentSize
    }
    
    // MARK:-
    // MARK:- Initialize
    
    override init() {
        super.init()
        
        scrollDirection = .vertical;
        minimumLineSpacing = 5.0
        minimumInteritemSpacing = 5.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        scrollDirection = .vertical;
        minimumLineSpacing = 5.0
        minimumInteritemSpacing = 5.0
    }
    
    
    // MARK:-
    // MARK:- Override
    
    override func prepare() {
        super.prepare()
        
        if (collectionView?.numberOfSections == 0 ||
            collectionView?.numberOfItems(inSection: 0) == 0) {
            return
        }
        
        var x:CGFloat = 0
        var y:CGFloat = 0
        var iSize:CGSize = CGSize.zero
        
        var indexPath:NSIndexPath?
        let numberOfItems:NSInteger = (self.collectionView?.numberOfItems(inSection: 0))!
        itemAttributesCache = []
        
        for index in 0..<numberOfItems {
            indexPath = NSIndexPath(item: index, section: 0)
            iSize = (delegate?.collectionView(collectionView!, itemSizeAt: indexPath!))!
            
            var itemRect:CGRect = CGRect(x: x, y: y, width: iSize.width, height: iSize.height)
            if (x > 0 && (x + iSize.width + minimumInteritemSpacing > (collectionView?.frame.size.width)!)) {
                //...Checking if item width is greater than collection view width then set item in new row.
                itemRect.origin.x = 0
                itemRect.origin.y = y + iSize.height + minimumLineSpacing
            }
            
            let itemAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath! as IndexPath)
            itemAttributes.frame = itemRect
            itemAttributesCache.append(itemAttributes)
            
            x = itemRect.origin.x + iSize.width + minimumInteritemSpacing
            y = itemRect.origin.y
        }
        
        y += iSize.height + self.minimumLineSpacing
        x = 0
        
        contentSize = CGSize(width: (collectionView?.frame.size.width)!, height: y)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let numberOfItems:NSInteger = (self.collectionView?.numberOfItems(inSection: 0))!
        let itemAttributes = itemAttributesCache.filter {
            $0.frame.intersects(rect) &&
                $0.indexPath.row < numberOfItems
        }
        
        return itemAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return itemAttributesCache.first {
            $0.indexPath == indexPath
        }
    }
}
