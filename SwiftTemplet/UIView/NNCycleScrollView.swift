//
//  NNCycleScrollView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/3.
//  Copyright © 2020 BN. All rights reserved.
//
/*
 1.方案
 N张照片把contentsSize设置为N+2个图片的宽度，例子如下，两端填充如图，当处于一端时，且即将进入循环状态的时候，如第二张图，从状态1滑动到状态2，在滑动结束的时候，将当前的位置直接转到状态3，直接setContentOffset神不知鬼不觉，视觉上是循环的。
[ABCD] - 图片数组
[D A B C D A] - UICollectionView数据源
 2 1     3
 
 */


import UIKit
import SDWebImage

@objc public protocol NNCycleScrollViewDelegate : class {
    @objc func didSelectedIndex(_ index: Int)
    @objc optional func cellForItem(_ collectionView: UICollectionView, cellForItemAtIndexPath indexPath: IndexPath) -> UICollectionViewCell
}

///轮播图
@objcMembers class NNCycleScrollView: UIView {

    var delegate: NNCycleScrollViewDelegate?
    
    var direction: UICollectionView.ScrollDirection = .horizontal{
        willSet{
            flowLayout.scrollDirection = newValue
        }
    }
    var pageControl: UIPageControl = UIPageControl()
    var timeInterval: TimeInterval = 2
    ///图像链接或者文本
    var list: [String] = []{
        willSet{
            if newValue.count == 0 {
                return
            }
            pageControl.numberOfPages = list.count
            if !pageControl.isHidden {
                pageControl.isHidden = (list.count <= 1)
            }
            
            collectionView.isScrollEnabled = (list.count > 1)
            isAutoScroll = collectionView.isScrollEnabled;
            collectionView.reloadData()

            if isinFiniteLoop && list.count > 1 {
                let indexPath = IndexPath(item: 1, section: 0)
                collectionView.scrollToItem(at: indexPath, at: [], animated: false)
            }
        }
    }
    var isinFiniteLoop: Bool = true
    var isAutoScroll: Bool = true{
        willSet{
            if newValue == false {
                return
            }
            initTimer()
        }
    }

    lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal;
        layout.itemSize = UIScreen.main.bounds.size;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: self.bounds, collectionViewLayout: self.flowLayout)
        view.backgroundColor = .gray
        view.showsHorizontalScrollIndicator = false;
        view.showsVerticalScrollIndicator = false;
        view.isPagingEnabled = true;
        view.delegate = self;
        view.dataSource = self;
        
        view.register(cellType: UICTViewCellOne.self)
        return view
    }()
    
    var timer:Timer?
    
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        addSubview(pageControl)
        
        initTimer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        flowLayout.itemSize = bounds.size
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(30);
        }
    }
    
    // MARK: -funtions
    
    func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func initTimer() {
        invalidateTimer()
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(automaticScroll), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    @objc func automaticScroll() {
        if list.count == 0 || list.count == 1 {
            return
        }
        let currentIndex = self.currentIndex()
        let targetIndex = currentIndex + 1
        let indexPath = IndexPath(item: targetIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: [], animated: true)
    }
    
    func dataSourceIndex(forCurrentIndex index: Int) -> Int {
        var dataIndex = 0
        if isinFiniteLoop && list.count > 1 {
            if index == 0 {
                dataIndex = list.count - 1
            } else if index == list.count + 1 {
                dataIndex = 0
            } else {
                dataIndex = index - 1
            }
        } else {
            dataIndex = index
        }
        return dataIndex
    }
    
    func currentIndex() -> Int {
        if collectionView.bounds.size.width == 0 || collectionView.bounds.size.height == 0 {
            return 0
        }
        var index = 0
        if flowLayout.scrollDirection == .horizontal {
            index = Int((collectionView.contentOffset.x + flowLayout.itemSize.width * 0.5) / flowLayout.itemSize.width)
        } else {
            index = Int((collectionView.contentOffset.y + flowLayout.itemSize.height * 0.5) / flowLayout.itemSize.height)
        }
        return max(0, index)
    }
}

extension NNCycleScrollView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isinFiniteLoop && list.count > 1 {
            return list.count + 2
        }
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = delegate?.cellForItem?(collectionView, cellForItemAtIndexPath: indexPath) {
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(for: UICTViewCellOne.self, indexPath: indexPath)
        let currentIndex: Int = dataSourceIndex(forCurrentIndex: indexPath.item)
        let obj: String = list[currentIndex]
        
        if let imageURL = URL(string: obj), obj.hasPrefix("http") {
            cell.label.isHidden = true
            cell.imgView.isHidden = false

            cell.imgView.contentMode = .scaleToFill
            cell.imgView.sd_setImage(with: imageURL, placeholderImage: UIImage(named:"img_car_default"))
        } else {
            cell.imgView.isHidden = true
            cell.label.isHidden = false
            
            cell.label.text = obj
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectedIndex(indexPath.item)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = dataSourceIndex(forCurrentIndex: currentIndex())
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if isAutoScroll {
            invalidateTimer()
        }
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if isAutoScroll {
            initTimer()
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let currentIndex = self.currentIndex()
        if isinFiniteLoop && list.count > 1 {
            if currentIndex == 0 {
                let indexPath = IndexPath(item: list.count, section: 0)
                collectionView.scrollToItem(at: indexPath, at: [], animated: false)
            } else if currentIndex == list.count + 1 {
                let indexPath = IndexPath(item: 1, section: 0)
                collectionView.scrollToItem(at: indexPath, at: [], animated: false)
            }
        }
    }

}
