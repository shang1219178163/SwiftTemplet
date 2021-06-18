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
        return view
    }()
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "UICollectionView小解"
        view.backgroundColor = UIColor.white
       
        // 注册cell
        ctView.dictClass = [UICollectionView.elementKindSectionHeader: ["UICTReusableViewOne", "UICTViewCellSubtitle"],
                            UICollectionView.elementKindSectionFooter: ["UICTReusableViewZero", "UICTViewCellValue"],
                            UICollectionView.elementKindSectionItem: ["UICTViewCellZero","UICTViewCellOne"],
        ]
        view.addSubview(ctView)

//        view.addGestureTap { (sender) in
//            guard let tap = sender as? UITapGestureRecognizer else { return }
//            DDLog(tap)
//        }
        
//        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
//        let one : AnyClass = NSClassFromString(namespace + "." + "UICTViewCellZero")!;
//        let two = UICTViewCellZero.self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //导航栏变色
//        navigationController?.navigationBar.setBackgroundImage(UIImage(color: UIColor.orange), for: UIBarMetrics.default)
//        navigationController?.navigationBar.shadowImage = UIImage(color: UIColor.orange)

        //导航栏透明
//        navigationController?.navigationBar.setBackgroundImage(UIImage(color: UIColor.clear), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage(color: UIColor.clear)
//
//        //顶部布局从导航栏开始
//        edgesForExtendedLayout = UIRectEdge.all;
        
        DDLog(ctView == view.subviews[0])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
//        navigationController?.navigationBar.shadowImage = nil
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
}

extension UICollectionDispalyController: UICollectionViewDataSource, UICollectionViewDelegate{
    //MARK: --UICollectionView
   func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 2
   }

   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 12
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
             
                view.lab.text = kind.components(separatedBy: "ElementKind").last! + UICTViewCellSubtitle.identifier
                view.labDetail.text = "999+"
                view.getViewLayer()
                return view;
             }
            
             let view = collectionView.dequeueReusableSupplementaryView(for: UICTViewCellValue.self, kind: kind, indexPath: indexPath)
             view.lab.text = kind.components(separatedBy: "ElementKind").last! + UICTViewCellValue.identifier
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
    
}
