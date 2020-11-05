//
//  NNCycleViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/10/23.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class NNCycleViewController: UIViewController {

    
    /// 载体布局视图
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout();
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        // 设置分区头视图和尾视图宽高
//        layout.headerReferenceSize = CGSize(width: kScreenWidth, height: 60)
//        layout.footerReferenceSize = CGSize(width: kScreenWidth, height: 60)
        
        return layout;
    }()
    /// 内容载体视图
    lazy var collectionView: UICollectionView = {
        let ctView = UICollectionView(frame: self.view.bounds, collectionViewLayout: self.layout)
        ctView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        ctView.backgroundColor = UIColor.white;
        ctView.showsVerticalScrollIndicator = false;
        ctView.showsHorizontalScrollIndicator = false;
        ctView.scrollsToTop = false;
        ctView.isPagingEnabled = true;
        ctView.bounces = false;
        ctView.dataSource = self;
        ctView.delegate = self;
        ctView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        ctView.register(cellType: UICTViewCellOne.self)
        return ctView;
    }()
    
    var viewControllers: [UIViewController] = []{
        willSet{
            children.forEach { (vc) in
                vc.removeFromParent()
            }

            newValue.forEach { (vc) in
                self.addChild(vc)
            }
            collectionView.reloadData()
//            DDLog(children.count)
        }
    }
    
    var scrollViewPageIdx: Int = 0
    
    var scrollViewPageIdxBlock: ((Int)->Void)?
    

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        edgesForExtendedLayout = []
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        
//        let list = [String].init(repeating: "0", count: 3)
      
//        var a = [UIViewController]()
//        list.forEach { (value) in
//            let vc = UIViewController()
//            vc.view.backgroundColor = .random
//            vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//            a.append(vc)
//        }
//        viewControllers = a
        viewControllers = [FirstViewController(), SecondViewController(), ThirdViewController()]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        layout.itemSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
//        layout.itemSize = self.view.bounds.size
        collectionView.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        children.forEach { $0.beginAppearanceTransition(true, animated: animated) }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        children.forEach { $0.endAppearanceTransition() }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        children.forEach { $0.beginAppearanceTransition(false, animated: animated) }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        children.forEach { $0.endAppearanceTransition() }
    }

}


extension NNCycleViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    // MARK: -UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return children.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        
        let childVC = children[indexPath.row]
        if cell.subviews.contains(childVC.view) == false {
            cell.addSubview(childVC.view)
        } else {
            cell.bringSubviewToFront(childVC.view)
        }
        childVC.view.backgroundColor = .white
        childVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        childVC.view.frame = CGRect(x: 0, y: 0, width: layout.itemSize.width, height: layout.itemSize.height)
//        childVC.view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return cell }
        childVC.view.frame = CGRect(x: 0, y: 0, width: layout.itemSize.width, height: layout.itemSize.height)
        return cell;
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        DDLog("")
        
        if scrollView == collectionView {
            scrollViewPageIdx = Int(scrollView.contentOffset.x/layout.itemSize.width)
            scrollViewPageIdxBlock?(scrollViewPageIdx)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        let childVC = children[indexPath.row]
//
//        DDLog("")
////        childVC.beginAppearance(true, animated: true)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        let childVC = children[indexPath.row]
//        DDLog("")
//
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//
//    }
        
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let idx = Int(scrollView.contentOffset.x/self.layout.itemSize.width)
//        guard let childVC = children[idx] as? UIViewController else {
//            return
//        }
//        if let titleView = childVC.navigationItem.titleView {
//            navigationItem.titleView = titleView
//
//        } else {
//            navigationItem.titleView = nil
//            self.title = childVC.title ?? "\(idx)"
//        }
//    }
}

extension NNCycleViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }

}
