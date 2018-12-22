//
//  ViewController.swift
//  YYCollectionView
//
//  Created by Domo on 2018/6/27.
//  Copyright © 2018年 知言网络. All rights reserved.
//

import UIKit

import SwiftExpand

class UICollectionDispalyController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate{
    var collectionView : UICollectionView?
    let Identifier       = "UICTViewCellZero"
    let headerIdentifier = "UICTReusableViewZeroHeader"
    let footIdentifier   = "UICTReusableViewZeroFooter"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "UICollectionView小解"
        self.view.backgroundColor = UIColor.white
        // 初始化
        let layout = UICollectionViewFlowLayout()
        let itemW = (kScreenWidth - 5*5.0)/4.0
        layout.itemSize = CGSize(width: itemW, height: itemW)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
//        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        // 设置分区头视图和尾视图宽高
        layout.headerReferenceSize = CGSize(width: kScreenWidth, height: 60)
        layout.footerReferenceSize = CGSize(width: kScreenWidth, height: 60)

        collectionView = UICollectionView(frame: CGRect(x:0, y:64, width:kScreenWidth, height:400), collectionViewLayout: layout)
        collectionView!.backgroundColor = UIColor.white
        collectionView!.delegate = self
        collectionView!.dataSource = self
        self.view.addSubview(collectionView!)
        
        // 注册cell
        collectionView?.register(UICTViewCellZero.self, forCellWithReuseIdentifier: Identifier)
        // 注册headerView
        collectionView?.register(UICTReusableViewZero.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        // 注册footView
        collectionView?.register(UICTReusableViewZero.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footIdentifier)
   
//        collectionView!.dictClass = [UICollectionElementKindSectionHeader : ["UICTReusableViewZero",],
//                                     UICollectionElementKindSectionFooter : ["UICTReusableViewZero",],
//                                     UICollectionElementKindSectionItem : ["UICTViewCellZero",],
//                                    ]
//        collectionView?.registerAll();
        
        
        
//        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
//        let one : AnyClass = NSClassFromString(namespace + "." + "UICTViewCellZero")!;
//        
//        let two = UICTViewCellZero.self
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView?.frame = CGRect(x: 0, y: 64, width: kScreenWidth, height:collectionView!.collectionViewLayout.collectionViewContentSize.height);

    }
    
    //header高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        return layout.itemSize
    }
    //footer高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        return layout.itemSize
        
    }

    //设定header和footer的方法，根据kind不同进行不同的判断即可
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = UICTReusableViewZero.dequeueCTVReusable(collectionView, kind: kind, indexPath: indexPath) as! UICTReusableViewZero
        view.label.text = kind;
        return view;
      
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = UICTViewCellZero.dequeueCTVCell(collectionView, indexPath: indexPath) as! UICTViewCellZero        
        cell.imgView.backgroundColor = armColor()
        cell.label.text = String(format:"%ditem",indexPath.row)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      print(indexPath.row)
    }

    func armColor()->UIColor{
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

