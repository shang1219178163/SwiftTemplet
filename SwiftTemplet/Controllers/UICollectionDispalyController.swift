//
//  ViewController.swift
//  YYCollectionView
//
//  Created by Domo on 2018/6/27.
//  Copyright © 2018年 知言网络. All rights reserved.
//

import UIKit
import SwiftExpand

class UICollectionDispalyController: UIViewController{

    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionView.layoutDefault();
        layout.headerReferenceSize = CGSize(width: self.view.bounds.width, height: 60);
        layout.footerReferenceSize = CGSize(width: self.view.bounds.width, height: 60);

        return layout;
    }()
    
    lazy var ctView: UICollectionView = {
        let view = UICollectionView.create(self.view.bounds, layout: self.flowLayout)
        view.backgroundColor = .white

        view.delegate = self
        view.dataSource = self
        
        view.addLongPressDragItem()

        return view
    }()
    
    
//    lazy var collectionView : UICollectionView = {
//
//        // 初始化
//        let layout = UICollectionViewFlowLayout()
//        let itemW = (kScreenWidth - 5*5.0)/4.0
//        layout.itemSize = CGSize(width: itemW, height: itemW)
//        layout.minimumLineSpacing = 5
//        layout.minimumInteritemSpacing = 5
//        //        layout.scrollDirection = .vertical
//        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//        // 设置分区头视图和尾视图宽高
//        layout.headerReferenceSize = CGSize(width: kScreenWidth, height: 60)
//        layout.footerReferenceSize = CGSize(width: kScreenWidth, height: 60)
//
//        let view = UICollectionView(frame: CGRect(x:0, y:64, width:kScreenWidth, height:400), collectionViewLayout: layout)
//        view.backgroundColor = UIColor.white
//        view.delegate = self
//        view.dataSource = self
//
//        // 注册cell
//        collectionView?.register(UICTViewCellZero.self, forCellWithReuseIdentifier: Identifier)
//        // 注册headerView
//        collectionView?.register(UICTReusableViewOne.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "UICTReusableViewOne"+"Header")
//        // 注册footView
//        collectionView?.register(UICTReusableViewZero.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footIdentifier)
//
//        view.dictClass = [UICollectionView.elementKindSectionHeader : ["UICTReusableViewOne",],
//                                     UICollectionView.elementKindSectionFooter : ["UICTReusableViewZero",],
//                                     UICollectionElementKindSectionItem : ["UICTViewCellZero","UICTViewCellOne"],
//        ]
//        view.registerAll();
//        return view
//    }()
    
    var list = [[String].init(count: 12, generator: {"\($0)"}), [String].init(count: 9, generator: {"\($0)"})]
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        title = "UICollectionView小解"

        // 注册cell
        ctView.dictClass = [UICollectionView.elementKindSectionHeader: ["UICTReusableViewOne", "UICTViewCellSubtitle"],
                            UICollectionView.elementKindSectionFooter: ["UICTReusableViewZero", "UICTViewCellValue"],
                            UICollectionView.elementKindSectionItem: ["UICTViewCellZero", "UICTViewCellOne"],
        ]
        view.addSubview(ctView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
        
}

extension UICollectionDispalyController: UICollectionViewDataSource, UICollectionViewDelegate{
    //MARK: --UICollectionView
   func numberOfSections(in collectionView: UICollectionView) -> Int {
    return list.count
   }

   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return list[section].count
   }

   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
       if indexPath.row % 2 == 0 {
        let cell = collectionView.dequeueReusableCell(for: UICTViewCellOne.self, indexPath: indexPath)
        cell.lineBottom.isHidden = false
        cell.lineRight.isHidden = false
//        cell.imgView.backgroundColor = .random
           cell.lab.text = String(format:"%ditem",indexPath.row)
           return cell
       }
        let cell = collectionView.dequeueReusableCell(for: UICTViewCellZero.self, indexPath: indexPath)
        cell.lineBottom.isHidden = false
        cell.lineRight.isHidden = false
    
//       cell.imgView.backgroundColor = .random
       cell.lab.text = String(format:"%ditem",indexPath.row)
    
       return cell
   }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
   
   //设定header和footer的方法，根据kind不同进行不同的判断即可
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        DDLog(kind);
        
        switch indexPath.section {
        case 1:
            if kind == UICollectionView.elementKindSectionHeader {
                let view = collectionView.dequeueReusableSupplementaryView(for: UICTViewCellSubtitle.self, kind: kind, indexPath: indexPath)
             
                view.lab.text = kind.components(separatedBy: "ElementKind").last! + UICTViewCellSubtitle.reuseIdentifier
                view.labDetail.text = "999+"
                view.getViewLayer()
                return view;
             }
            
             let view = collectionView.dequeueReusableSupplementaryView(for: UICTViewCellValue.self, kind: kind, indexPath: indexPath)
             view.lab.text = kind.components(separatedBy: "ElementKind").last! + UICTViewCellValue.reuseIdentifier
             view.labDetail.text = "999+"
             view.getViewLayer()
             return view;
            
        default:
            if kind == UICollectionView.elementKindSectionHeader {
                let view = collectionView.dequeueReusableSupplementaryView(for: UICTReusableViewOne.self, kind: kind, indexPath: indexPath)
             
                view.lab.text = kind.components(separatedBy: "ElementKind").last;
                view.labDetail.text = "999+"
                 view.getViewLayer()
                return view;
             }
            
             let view = collectionView.dequeueReusableSupplementaryView(for: UICTReusableViewZero.self, kind: kind, indexPath: indexPath)
             view.lab.text = kind.components(separatedBy: "ElementKind").last;
             view.getViewLayer()
             return view;
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        list[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        list[destinationIndexPath.section].insert(list[sourceIndexPath.section][sourceIndexPath.row], at: destinationIndexPath.row)
    }
    
}
