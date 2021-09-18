//
//  IOPImageBrowserController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/31.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class IOPImageBrowserController: UIViewController {

    lazy var flowLayout: NNCollectionViewCardFlowLayout = {
        let layout = NNCollectionViewCardFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let itemW = kScreenWidth*0.9
        layout.itemSize = CGSize(width: itemW, height: 170)

        return layout;
    }()
    
    lazy var ctView: UICollectionView = {
        let view = UICollectionView.create(self.view.bounds, layout: self.flowLayout)
        view.backgroundColor = .white
        view.isPagingEnabled = false

        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    var dataList = [String]()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         view.backgroundColor = .white
                    
        for j in 0 ..< 5 {
            dataList.append("\(j)")
        }
        
         // 注册cell
         ctView.dictClass = [UICollectionView.elementKindSectionItem: ["UICTViewCellTwo",],
         ]
         view.addSubview(ctView)
    }
    


}

extension IOPImageBrowserController: UICollectionViewDataSource, UICollectionViewDelegate{
    //MARK: --UICollectionView
   func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
   }

   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataList.count
   }

   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: UICTViewCellTwo.self, indexPath: indexPath)
        cell.lineBottom.isHidden = false
        cell.lineRight.isHidden = false
    
        cell.imgView.backgroundColor = .random
        cell.lab.text = String(format:"%ditem",indexPath.row)
    
        cell.getViewLayer()
       return cell
   }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
