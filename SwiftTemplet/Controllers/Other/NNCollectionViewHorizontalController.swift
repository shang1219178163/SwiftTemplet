
//
//  NNCollectionViewHorizontalController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/8/27.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class NNCollectionViewHorizontalController: UIViewController{
  
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
        
//        collectionView.frame = view.bounds;
    }
        
    // MARK: -funtions

    // MARK: -lazy
    lazy var layout: UICollectionViewFlowLayout = {
//        let layout = UICollectionViewFlowLayout();
////        layout.scrollDirection = .horizontal
//
//        let numOfRow: Int = 4
//        let spacing: CGFloat = 10
//        let width = UIScreen.main.bounds.width
//
//        let itemWidth = (width - (numOfRow.toCGFloat + 1)*spacing - layout.sectionInset.left - layout.sectionInset.right)/numOfRow.toCGFloat
//        let itemHeight = itemWidth/0.75
//
//        let itemSize = CGSize(width: round(itemWidth), height: itemHeight)
//        let headerSize = CGSize(width: width, height: 40)
//        let footerSize = CGSize(width: width, height: 30)
//
//        layout.minimumInteritemSpacing = spacing
//        layout.minimumLineSpacing = spacing
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        layout.itemSize = itemSize
//
//        // 设置分区头视图和尾视图宽高
//        layout.headerReferenceSize = headerSize
//        layout.footerReferenceSize = footerSize
//        return layout;
        return UICollectionViewFlowLayout(numOfRow: 4)
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: self.view.bounds, collectionViewLayout: self.layout)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        let view = UICollectionView(frame: self.view.bounds, collectionViewLayout: UICollectionView.layoutDefault())
        view.backgroundColor = .background;
        view.showsVerticalScrollIndicator = false;
        view.showsHorizontalScrollIndicator = false;
        view.scrollsToTop = false;
        view.isPagingEnabled = true;
//        ctView.bounces = false;
        view.dataSource = self;
        view.delegate = self;
//        ctView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        
        view.register(cellType: UICTViewCellOne.self)
        view.register(supplementaryViewType: UICTReusableViewZero.self, ofKind: UICollectionView.elementKindSectionHeader)
        view.register(supplementaryViewType: UICTReusableViewZero.self, ofKind: UICollectionView.elementKindSectionFooter)
        return view;
    }()
    
    lazy var indicatorView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor.clear.cgColor;
        return view;
    }()
}

extension NNCollectionViewHorizontalController: UICollectionViewDataSource, UICollectionViewDelegate {
    // MARK: -UICollectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let cell: UICTViewCellOne = collectionView.dequeueReusableCell(for: UICTViewCellOne.self, indexPath: indexPath)
        cell.contentView.backgroundColor = UIColor.random
        cell.imgView.isHidden = true;
        cell.lab.text = "标题_\(indexPath.toString)"

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
}
