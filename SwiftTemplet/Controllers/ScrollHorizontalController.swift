
//
//  ScrollHorizontalController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/8/27.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class ScrollHorizontalController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
  
    var list: NSMutableArray = [];
    override func viewDidLoad() {
        super.viewDidLoad()

        list = ["1", "2", "3", "4", "5", ];

        view.addSubview(collectionView)
//        view.addSubview(scrollView)
//        self.scrollView.collectionView.reloadData();

        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.frame = CGRectMake(0, 20, 400, 40);
        collectionView.frame = CGRectMake(0, 20, 400, 400);
    }
    
    // MARK: -UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let cell: UICTViewCellOne = collectionView.dequeueReusableCell(for: UICTViewCellOne.self, indexPath: indexPath)
        cell.contentView.backgroundColor = UIColor.random
        cell.imgView.isHidden = true;
        cell.label.text = "111"
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let isScrollHorizontal = layout.scrollDirection == .horizontal;
        let scrollPosition = isScrollHorizontal ? UICollectionView.ScrollPosition.centeredHorizontally : UICollectionView.ScrollPosition.centeredVertically;
        collectionView.scrollToItem(at: indexPath, at: scrollPosition, animated: true)
      
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(for: UICTReusableViewZero.self, kind: kind,indexPath: indexPath);
        
        return view;
    }
    
    // MARK: -funtions

    // MARK: -lazy
    lazy var layout: UICollectionViewFlowLayout = {
//        let layout = UICollectionViewFlowLayout();
////        layout.scrollDirection = .horizontal
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//
//        let rowNum: Int = 4
//        let spacing: CGFloat = 10
//        let width = UIScreen.main.bounds.width;
//
//        let itemWidth = (width - (rowNum.toCGFloat + 1)*spacing - layout.sectionInset.left - layout.sectionInset.right)/rowNum.toCGFloat;
//        let itemHeight = itemWidth/0.75;
//
//        let itemSize = CGSize(width: round(itemWidth), height: itemHeight);
//        let headerSize = CGSize(width: width, height: 40);
//        let footerSize = CGSize(width: width, height: 30);
//
//        layout.itemSize = itemSize
//        layout.minimumLineSpacing = spacing;
//        layout.minimumInteritemSpacing = spacing;
//        // 设置分区头视图和尾视图宽高
//        layout.headerReferenceSize = headerSize
//        layout.footerReferenceSize = footerSize
//
//        return layout;
        
        return UICollectionViewLayout.createFlowLayout()
//        return UICollectionView.layoutDefault()

    }()
    
    lazy var collectionView: UICollectionView = {
//        let ctView = UICollectionView(frame: self.view.bounds, collectionViewLayout: self.layout)
        let ctView = UICollectionView(frame: self.view.bounds, collectionViewLayout: UICollectionView.layoutDefault)

        ctView.backgroundColor = UIColor.white;
        ctView.showsVerticalScrollIndicator = false;
        ctView.showsHorizontalScrollIndicator = false;
        ctView.scrollsToTop = false;
        ctView.isPagingEnabled = true;
        ctView.bounces = false;
        ctView.dataSource = self;
        ctView.delegate = self;
//        ctView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "UICollectionViewCell")
        ctView.register(cellType: UICTViewCellOne.self)
        ctView.register(supplementaryViewType: UICTReusableViewZero.self, ofKind: UICollectionView.elementKindSectionHeader)
        ctView.register(supplementaryViewType: UICTReusableViewZero.self, ofKind: UICollectionView.elementKindSectionFooter)

        return ctView;
    }()
    
    lazy var indicatorView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor.clear.cgColor;
        return view;
    }()
}
