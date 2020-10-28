
//
//  NNSegmentView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/8/27.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// UISegmentedControl 升级版,支持0: box, 1, topLine, 2,bottomLine 三种样式
@objcMembers class NNSegmentView: UIView {
    
    public enum IndicatorType : Int {
        case none
        case box
        case topLine
        case bottomLine
    }
        
    public var showItemNum: CGFloat = 4;
    public var indicatorHeight: CGFloat = 2;
    public var indicatorType: IndicatorType = .bottomLine;

    public var cellForItemClosure: CellForItemClosure?
    public var didSelectItemClosure: DidSelectItemClosure?
    
    public var list: [String] = []{
        willSet{
            if newValue.count < Int(showItemNum) {
                showItemNum = CGFloat(newValue.count);
            }
            collectionView.reloadData();
        }
    }
    
    public var selectIndexPath = IndexPath(row: 0, section: 0) {
        didSet{
            setupIndicator();
            collectionView.selectItem(at: oldValue, animated: true, scrollPosition: .centeredHorizontally)
            collectionView.reloadData();
        }
    }
    
    public var normalColor = UIColor.gray;
    public dynamic var selectedColor = UIColor.theme {
        didSet{
            indicatorView.layer.backgroundColor = oldValue.withAlphaComponent(0.2).cgColor;
            indicatorView.layer.borderColor = oldValue.cgColor;
        }
    }
    

    // MARK: -life cycle
    override var intrinsicContentSize: CGSize{
        return UIView.layoutFittingExpandedSize
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        collectionView.addSubview(indicatorView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        collectionView.frame = self.bounds;
        if layout.scrollDirection == .horizontal {
            layout.itemSize = CGSize(width: collectionView.bounds.width/CGFloat(showItemNum),
                                     height: collectionView.bounds.height)
            
        } else {
            layout.itemSize = CGSize(width: collectionView.bounds.width,
                                     height: collectionView.bounds.height/CGFloat(showItemNum))

        }
        
        setupIndicator()
    }
    
    
    // MARK: -funtions
    func blockCellForItem(_ action:@escaping CellForItemClosure) {
        self.cellForItemClosure = action;
    }
    
    func blockDidSelectItem(_ action:@escaping DidSelectItemClosure) {
        self.didSelectItemClosure = action;
    }
    
    func setupIndicator() {
        if CGRect.zero.equalTo(self.bounds) || list.count == 0 {
            return;
        }
        
        switch indicatorType {
        case .topLine:
            self.indicatorView.isHidden = false
            self.indicatorView.layer.backgroundColor = self.selectedColor.cgColor;
            UIView.animate(withDuration: 0.15) {
                if self.layout.scrollDirection == .horizontal {
                    self.indicatorView.frame = CGRectMake(self.layout.itemSize.width * CGFloat(self.selectIndexPath.row),
                                                          0,
                                                          self.layout.itemSize.width,
                                                          self.indicatorHeight);
                    
                } else {
                    self.indicatorView.frame = CGRectMake(0,
                                                          self.layout.itemSize.height * CGFloat(self.selectIndexPath.row),
                                                          self.indicatorHeight,
                                                          self.layout.itemSize.height);
                }
            };
            
        case .bottomLine:
            self.indicatorView.isHidden = false
            self.indicatorView.layer.backgroundColor = self.selectedColor.cgColor;
            UIView.animate(withDuration: 0.15) {
                if (self.layout.scrollDirection == .horizontal) {
                    self.indicatorView.frame = CGRectMake(self.layout.itemSize.width * CGFloat(self.selectIndexPath.row),
                                                          self.layout.itemSize.height - self.indicatorHeight,
                                                          self.layout.itemSize.width,
                                                          self.indicatorHeight);
                    
                } else {
                    self.indicatorView.frame = CGRectMake(self.layout.itemSize.width - self.indicatorHeight,
                                                          self.layout.itemSize.height * CGFloat(self.selectIndexPath.row),
                                                          self.indicatorHeight,
                                                          self.layout.itemSize.height);
                }
            };
            
        case .box:
            self.indicatorView.isHidden = false
            self.indicatorView.layer.backgroundColor = self.selectedColor.withAlphaComponent(0.2).cgColor;
            UIView.animate(withDuration: 0.15) {
                if (self.layout.scrollDirection == .horizontal) {
                    self.indicatorView.frame = CGRectMake(self.layout.itemSize.width * CGFloat(self.selectIndexPath.row),
                                                          0,
                                                          self.layout.itemSize.width,
                                                          self.layout.itemSize.height);
                    
                } else {
                    self.indicatorView.frame = CGRectMake(0,
                                                          self.layout.itemSize.height * CGFloat(self.selectIndexPath.row),
                                                          self.layout.itemSize.width,
                                                          self.layout.itemSize.height);
                    
                }
            };
            
        default:
            self.indicatorView.isHidden = true;
        }
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
        ctView.bounces = false;
        ctView.dataSource = self;
        ctView.delegate = self;
        ctView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        return ctView;
    }()
    /// 指示器视图
    lazy var indicatorView: UIView = {
        let view = UIView()
//        view.layer.backgroundColor = UIColor.clear.cgColor;
//        view.layer.backgroundColor = UIColor.theme.withAlphaComponent(0.2).cgColor;
//        view.layer.backgroundColor = UIColor.hexValue(0x0082e0, 0.3).cgColor;
//        view.layer.backgroundColor = self.selectedColor.withAlphaComponent(0.2).cgColor;
        view.layer.borderColor = self.selectedColor.cgColor;
        view.layer.borderWidth = self.indicatorHeight;
        return view;
    }()
    
}

extension NNSegmentView: UICollectionViewDataSource, UICollectionViewDelegate {
    // MARK: -UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (self.cellForItemClosure != nil && (self.cellForItemClosure!(collectionView, indexPath) != nil)) {
            return self.cellForItemClosure!(collectionView, indexPath)!;
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
//        cell.contentView.backgroundColor = UIColor.random
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let isScrollHorizontal = layout.scrollDirection == .horizontal;
        let scrollPosition = isScrollHorizontal ? UICollectionView.ScrollPosition.centeredHorizontally : UICollectionView.ScrollPosition.centeredVertically;
        collectionView.scrollToItem(at: indexPath, at: scrollPosition, animated: true)
        selectIndexPath = indexPath;
        if didSelectItemClosure != nil {
            didSelectItemClosure!(collectionView, indexPath)
        }
    }
}
