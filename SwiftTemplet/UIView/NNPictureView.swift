//
//  NNPictureView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/11/19.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKit

/// 图片浏览器
@objcMembers class NNPictureView: UIView {
    
    var usePanGesture: Bool = false
        
    var list: [String] = []{
        willSet{
//            DDLog(newValue)
            labelTop.text = "\(selectIndex+1)/\(newValue.count)"
            collectionView.reloadData();
        }
    }
    
    var selectIndex = 0{
        willSet{
            labelTop.text = "\(newValue+1)/\(list.count)"
            collectionView.scrollToItem(at: IndexPath(row: newValue, section: 0), at: .centeredHorizontally, animated: false)

        }
    }

    // MARK: -life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black;
        collectionView.backgroundColor = backgroundColor;
        labelTop.textColor = .white;
//        labelTop.backgroundColor = .red;
        
        collectionView.register(UICTViewCellTwo.self, forCellWithReuseIdentifier: "UICTViewCellTwo")
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
        
        
        labelTop.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(25);
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(labelTop.snp.bottom).offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
        }
        
        layout.itemSize = CGSize(width: bounds.width, height: bounds.height - 25)
        collectionView.scrollToItem(at: IndexPath(row: selectIndex, section: 0), at: .centeredHorizontally, animated: false)
    }

    // MARK: - funtions
    @objc private func p_handlePinchGesture(_ recognizer: UIPinchGestureRecognizer) {
        guard let senderView = recognizer.view else { return }
        let location = recognizer.location(in: senderView.superview)
        senderView.center = location;
        senderView.transform = senderView.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)

        recognizer.scale = 1.0
//        print(recognizer)
    }
    
    @objc private func p_handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        guard let senderView = recognizer.view else { return }
        let translate:CGPoint = recognizer.translation(in: recognizer.view?.superview)
        senderView.center = CGPoint(x: senderView.center.x + translate.x, y: senderView.center.y + translate.y)
        recognizer.setTranslation( .zero, in: senderView.superview)
//        print(recognizer)
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
        ctView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        return ctView;
    }()
    
    // MARK: - lazy
    lazy var labelTop: UILabel = {
        let view = UILabel.create()
        view.textAlignment = .right
        view.font = UIFont.systemFont(ofSize: 18)
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
        cell.imgView.sd_setImage(with: URL(string: value), placeholderImage: UIImage(named: "img_failedDefault_S"))
        cell.labelBom.text = value
        
        if usePanGesture == false {
            return cell;
        }
        
        if cell.imgView.gestureRecognizers == nil {
            let pinch = UIPinchGestureRecognizer(target: self, action: #selector(p_handlePinchGesture(_:)))
            pinch.scale = 1
            cell.imgView.isUserInteractionEnabled = true
            cell.imgView.isMultipleTouchEnabled = true
            cell.imgView.addGestureRecognizer(pinch)
            
            let pan = UIPanGestureRecognizer(target: self, action: #selector(p_handlePanGesture(_:)))
            //最大最小的手势触摸次数
            pan.minimumNumberOfTouches = 1
            pan.maximumNumberOfTouches = 3
            cell.imgView.addGestureRecognizer(pan)
        }
        
//        cell.contentView.backgroundColor = UIColor.random
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let isScrollHorizontal = (layout.scrollDirection == .horizontal);
//        let scrollPosition = isScrollHorizontal == true ? UICollectionView.ScrollPosition.centeredHorizontally : UICollectionView.ScrollPosition.centeredVertically;
//        collectionView.scrollToItem(at: indexPath, at: scrollPosition, animated: true)
        selectIndex = indexPath.row;
        
    }
    
}

extension NNPictureView: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.size.width);
        labelTop.text = "\(currentPage+1)/\(list.count)         "
    }

}

/// 添加分类支持
@objc extension UIImageView{
    private struct AssociateKeys {
        static var urls        = "UIImageView" + "urls"
        static var pictureView = "UIImageView" + "pictureView"
    }
    
    public var urls: [String] {
        get {
            return objc_getAssociatedObject(self, &AssociateKeys.urls) as! [String];
        }
        set {
            objc_setAssociatedObject(self, &AssociateKeys.urls, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    var pictureView: NNPictureView {
        get {
            var obj = objc_getAssociatedObject(self, &AssociateKeys.pictureView) as? NNPictureView;
            if obj == nil {
                obj = NNPictureView(frame: CGRect.zero);
                obj!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                obj!.isUserInteractionEnabled = true;
                
                objc_setAssociatedObject(self, &AssociateKeys.pictureView, obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return obj!;
        }
        set {
            objc_setAssociatedObject(self, &AssociateKeys.pictureView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public func showPictureView(_  urls: [String], index: Int = 0) {
        guard let window = UIApplication.shared.keyWindow else { return }
        pictureView.list = urls
        pictureView.selectIndex = index

        pictureView.frame = window.bounds;
//        pictureView.frame = CGRectMake(44, 44, window.bounds.width - 44*2, window.bounds.height)
        window.insertSubview(pictureView, at: 1)
        
        pictureView.alpha = 0;
        UIView.animate(withDuration: 0.15) {
            self.pictureView.alpha = 1;
        }
        
        _ = pictureView.addGestureTap { (reco) in
            UIView.animate(withDuration: 0.15, animations: {
                self.pictureView.alpha = 0;

            }) { (finished) in
                if finished == true {
                    reco.view?.removeFromSuperview()
                }
            }
        }
    }

}
