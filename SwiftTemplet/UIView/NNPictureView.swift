//
//  NNPictureView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/11/19.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

@objcMembers
class NNPictureView: UIView {
        
    var list: [String] = []{
        willSet{
            DDLog(newValue)
            labelTop.text = "1/\(newValue.count)"
            collectionView.reloadData();
        }
    }
    
    var selectIndex = 0 {
        didSet{
            collectionView.selectItem(at: IndexPath(row: oldValue, section: 0), animated: true, scrollPosition: .centeredHorizontally)
            collectionView.reloadData();
        }
    }

    // MARK: -life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black;
        collectionView.backgroundColor = backgroundColor;
        labelTop.textColor = .white;

        collectionView.register(UICTViewCellTwo.classForCoder(), forCellWithReuseIdentifier: "UICTViewCellTwo")
        addSubview(collectionView)
        addSubview(labelTop)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        if labelTop.isHidden == true {
            collectionView.frame = bounds;
            layout.itemSize = collectionView.frame.size;
            return;
        }
        
        labelTop.frame = CGRectMake(0, 0, bounds.width, kH_LABEL)
        collectionView.frame = CGRectMake(0, labelTop.maxY, bounds.width, bounds.height - kH_LABEL)
        layout.itemSize = collectionView.frame.size;
    }

        
    // MARK: -lazy
    /// 载体布局视图
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout();
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: self.bounds.width, height: self.bounds.height)
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
        let ctView = UICollectionView(frame: self.bounds, collectionViewLayout: self.layout)
        ctView.backgroundColor = UIColor.white;
        ctView.showsVerticalScrollIndicator = false;
        ctView.showsHorizontalScrollIndicator = false;
        ctView.scrollsToTop = false;
        ctView.isPagingEnabled = true;
//        ctView.bounces = false;
        ctView.dataSource = self;
        ctView.delegate = self;
        ctView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "UICollectionViewCell")
        return ctView;
    }()
    
    // MARK: - lazy
    lazy var labelTop: UILabel = {
        let view = UILabel.create()
        view.textAlignment = .center
        return view;
    }()
}

extension NNPictureView: UICollectionViewDataSource, UICollectionViewDelegate {
        
    // MARK: -UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        let cell = collectionView.dequeueReusableCell(for: UICTViewCellTwo.self, indexPath: indexPath)
        cell.contentView.backgroundColor = self.backgroundColor;
        cell.labelTop.isHidden = true;
        cell.labelBom.isHidden = true;

        let value = list[indexPath.row];
        cell.labelTop.text = "\(indexPath.row+1)/\(list.count)"
        cell.imgView.sd_setImage(with: URL(string: value), placeholderImage: UIImageNamed("img_failedDefault_S"))
        cell.labelBom.text = value
        
//        cell.contentView.backgroundColor = UIColor.random
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let isScrollHorizontal = layout.scrollDirection == .horizontal;
        let scrollPosition = isScrollHorizontal ? UICollectionView.ScrollPosition.centeredHorizontally : UICollectionView.ScrollPosition.centeredVertically;
        collectionView.scrollToItem(at: indexPath, at: scrollPosition, animated: true)
        selectIndex = indexPath.row;
        
    }
    
}

extension NNPictureView: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.size.width);
        labelTop.text = "\(currentPage+1)/\(list.count)"
    }

}
