//
//  UICollectionMainController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/11.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// 用 NNPageController 横向分页集成 UICollection 同前缀控制器页面
class UICollectionMainController: NNPageController {

    //MARK:属性
    lazy var items: [(UIViewController, String)] = {
        return [
            (UICollectionMultipleSectionController(), "多布局展示"),
            (NNCollectionViewHorizontalController(), "重构"),
            (UICollectionViewCardController(), "卡片样式"),
            (UICollectionDispalyController(), "UICollectionView展示"),
            (UICollectionBatchUpdateController(), "批量更新"),
            (UICollectionTagsController(), "tags"),
        ]
    }()

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        controllers = items.map { $0.0 }
        title = items.first?.1
    }

}
