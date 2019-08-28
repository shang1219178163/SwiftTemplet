
//
//  NNScrollView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/8/27.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class NNScrollView: UIView {

    lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout();
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 70, height: 90)
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        // 设置分区头视图和尾视图宽高
//        layout.headerReferenceSize = CGSize(width: kScreenWidth, height: 60)
//        layout.footerReferenceSize = CGSize(width: kScreenWidth, height: 60)
        
        return layout;
    }()
    
//    lazy var collectionView: <#type name#> = {
//        <#statements#>
//        return <#value#>
//    }()
//    
}
