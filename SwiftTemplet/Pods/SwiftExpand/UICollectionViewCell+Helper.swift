//
//  UICollectionViewCell+Helper.swift
//  SwiftExpand
//
//  Created by Bin Shang on 2018/12/22.
//

import Foundation

public extension UICollectionViewCell{
    
    ///获取UICollectionViewCell
    public static func dequeueCTVCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell{
        let identifier = NStringShortFromClass(classForCoder());
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return view
    }
    
}
