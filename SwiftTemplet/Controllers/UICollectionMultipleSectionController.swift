//
//  UICollectionMultipleSectionController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/5/29.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

class UICollectionMultipleSectionController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let layout = NNMultipleSectionFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5

        layout.headerReferenceSize = CGSize(width: self.view.frame.size.width, height: 40)
        layout.footerReferenceSize = CGSize(width: self.view.frame.size.width, height: 30)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.delegate = self
        
        let view = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        view.backgroundColor = UIColor.white
        view.alwaysBounceVertical = true
        
        view.register(cellType: UICTViewCellOne.self)
        view.register(UICTViewCellOne.self, forCellWithReuseIdentifier: "UICTViewCellOne")
        view.register(UICTViewCellOne.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "UICTViewCellOne")
        view.register(UICTViewCellOne.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "UICTViewCellOne")
        
        view.delegate   = self
        view.dataSource = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    private func sectionName(_ indexPath: IndexPath) -> String {
        switch indexPath.section {
        case 0:
            return "瀑布流布局{\(indexPath.section), \(indexPath.row)}"
        case 1:
            return "线性列表布局{\(indexPath.section), \(indexPath.row)}"
        case 2:
        return "九宫格布局{\(indexPath.section), \(indexPath.row)}"
        default:
            return ""
        }
    }

}

extension UICollectionMultipleSectionController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:// 瀑布流
            return 10
        case 1:// 线性
            return 3
        default:// 九宫格
            return 9
        }
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let view = collectionView.dequeueReusableCell(withReuseIdentifier: "UICTViewCellOne", for: indexPath) as? UICTViewCellOne else { return UICollectionViewCell() }
        view.lab.text = "{\(indexPath.section), \(indexPath.row)}"
        view.imgView.isHidden = true
        view.lab.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)

        return view
    }
  
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "UICTViewCellOne", for: indexPath) as? UICTViewCellOne else { return UICollectionReusableView() }
        view.imgView.isHidden = true
        
        view.lab.text = "\(sectionName(indexPath))"
        
        let isHeader: Bool = (kind == UICollectionView.elementKindSectionHeader)
        view.contentView.backgroundColor = isHeader ? .systemBlue : .systemGreen
        return view
    }
      
}

extension UICollectionMultipleSectionController: NNMultipleSectionFlowLayoutDelegate {
    
    func heightForItemAtIndexPath(_ collectionView: UICollectionView, layout: NNMultipleSectionFlowLayout, indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat {
        switch indexPath.section {
        case 0:
          return CGFloat((arc4random() % 3 + 1) * 30)
        case 1:
          return 135
        default:
          return 80
        }
    }
  
    func columnCount(_ collectionView: UICollectionView, layout: NNMultipleSectionFlowLayout, section: Int) -> Int {
        switch section {
        case 0:
          return 2
        case 1:
          return 1
        default:
          return 3
        }
    }
}

extension UICollectionMultipleSectionController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        switch section {
        case 0:
          return CGSize(width: self.view.frame.size.width, height: 40)
        case 1:
          return CGSize(width: self.view.frame.size.width, height: 20)
        default:
            return .zero
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        switch section {
//        case 0:
//          return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        case 1:
//          return UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
//        default:
//          return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
//        }
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 15
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 15
//    }
}
