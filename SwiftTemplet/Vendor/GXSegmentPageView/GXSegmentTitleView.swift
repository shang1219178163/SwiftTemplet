//
//  GXSegmentTitleView.swift
//  GXSegmentPageViewSample
//
//  Created by Gin on 2020/8/21.
//  Copyright © 2020 gin. All rights reserved.
//

import UIKit

@objc public protocol GXSegmentTitleViewDelegate: NSObjectProtocol {
    @objc optional func segmentTitleView(_ page: GXSegmentTitleView, at index: Int)
}

public class GXSegmentTitleView: UIView {
    public weak var delegate: GXSegmentTitleViewDelegate?
    
    private let GXCellID: String = "GXCellID"
    private var config: Configuration!
    private var titles: [String] = []
    private var titlesSizes: [CGSize] = []
    private var cellsSizes: [Int: CGSize] = [:]
    private var indicatorRects: [Int: CGRect] = [:]
    private var titlesTotalWidth: CGFloat = 0.0
    private var selectedIndex: Int = 0
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal
        
        return flowLayout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: self.layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.scrollsToTop = false
        collectionView.bounces = self.config.bounces
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GXSegmentTitleCell.self, forCellWithReuseIdentifier: GXCellID)
        
        return collectionView
    }()
    
    private lazy var underline: UIView = {
        let line = UIView()
        line.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        return line
    }()
    
    private lazy var indicator: UIView = {
        let indicator = UIView()
        indicator.autoresizingMask = [.flexibleTopMargin]
        return indicator
    }()
    
    convenience init(frame: CGRect, config: Configuration, titles: [String]) {
        self.init(frame: frame)
        self.setupSegmentTitleView(config: config, titles: titles)
    }
}

public extension GXSegmentTitleView {
    /// Xib initializes by calling a function
    func setupSegmentTitleView(config: Configuration, titles: [String]) {
        self.config = config
        self.titles = titles
        self.setupSubviews()
        self.updateConfiguration()
        self.setSelectIndex(at: 0)
    }
    /// 设置选项卡位置
    func setSelectIndex(at index: Int, animated: Bool = false) {
        self.collectionView.performBatchUpdates({
        }) {[weak self] (finish) in
            self?.setSelectedCell(at: index, animated: animated)
            self?.setSelectedIndicator(at: index, animated: animated)
        }
    }
    /// 联动视图调用
    func setSegmentTitleView(selectIndex: Int, willSelectIndex: Int, progress: CGFloat) {
        self.scrollTo(selectIndex: selectIndex, willSelectIndex: willSelectIndex, progress: progress)
    }
    func setConfiguration(config: Configuration) {
        self.config = config
        self.updateConfiguration()
        self.collectionView.reloadData()
    }
    func setTitles(titles: [String]) {
        self.titles = titles
        self.updateConfiguration()
        self.collectionView.reloadData()
    }
    func setTitle(title: String, for index: Int) {
        self.titles[index] = title
        self.collectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
    }
    func titleForIndex(at index: Int) -> String {
        return self.titles[index]
    }
}

fileprivate extension GXSegmentTitleView {
    /// 设置内容
    func setupSubviews() {
        self.addSubview(self.collectionView)
        if self.config.isShowBottomLine {
            self.addSubview(self.underline)
        }
        if self.config.positionStyle != .none {
            self.collectionView.addSubview(self.indicator)
        }
    }
    /// 更新配置
    func updateConfiguration() {
        self.titlesSizes.removeAll()
        self.cellsSizes.removeAll()
        self.indicatorRects.removeAll()
        self.config.setupGradientColorRGB()
        self.collectionView.bounces = self.config.bounces
        if self.config.isShowBottomLine {
            self.underline.backgroundColor = self.config.bottomLineColor
            var frame = self.bounds
            frame.origin.y = self.bounds.height - self.config.bottomLineHeight
            frame.size.height = self.config.bottomLineHeight
            self.underline.frame = frame
        }
        for title in self.titles {
            let size = self.gx_textSize(title, font: self.config.titleNormalFont)
            self.titlesSizes.append(size)
        }
        self.titlesTotalWidth = 0.0
        for titleSize in self.titlesSizes {
            self.titlesTotalWidth += (titleSize.width + self.config.titleMargin * 2)
        }
        if self.config.positionStyle != .none {
            self.indicator.backgroundColor = self.config.indicatorColor
            self.indicator.layer.cornerRadius = self.config.indicatorCornerRadius
            self.indicator.layer.borderWidth = self.config.indicatorBorderWidth
            self.indicator.layer.borderColor = self.config.indicatorBorderColor.cgColor
        }
        if self.config.positionStyle != .none {
            self.collectionView.performBatchUpdates({
            }) {[unowned self] (finish) in
                self.collectionView.sendSubviewToBack(self.indicator)
            }
        }
    }
    /// 计算获得cell的size
    func cellSize(cellForAt index: Int) -> CGSize {
        if self.cellsSizes[index] != nil {
            return self.cellsSizes[index]!
        }
        let height = self.collectionView.frame.height
        var width = self.config.titleFixedWidth
        // 标题为固定宽度
        if self.config.titleFixedWidth == 0 {
            // 标题为动态宽度,小于一屏配titleMargin补上
            var titleMargin = self.config.titleMargin * 2
            if self.titlesTotalWidth < self.collectionView.frame.width {
                let differenceW = self.collectionView.frame.width - self.titlesTotalWidth
                titleMargin +=  differenceW / CGFloat(self.titles.count)
            }
            width = self.titlesSizes[index].width + titleMargin
        }
        let size = CGSize(width: width, height: height)
        self.cellsSizes.updateValue(size, forKey: index)
        return size
    }
    /// 获取指示器位置
    func rectIndicator(cell: GXSegmentTitleCell, index: Int) -> CGRect {
        if self.indicatorRects[index] != nil {
            return self.indicatorRects[index]!
        }
        let titleSize = self.titlesSizes[index]
        var width = self.config.indicatorFixedWidth
        if width == 0 {
            width = titleSize.width + self.config.indicatorAdditionWidthMargin * 2
        }
        var height = self.config.indicatorFixedHeight
        if height == 0 {
            height = titleSize.height + self.config.indicatorAdditionHeightMargin * 2
        }
        let left = cell.frame.origin.x + (cell.frame.width - width) * 0.5
        var top: CGFloat = 0.0
        switch self.config.positionStyle {
        case .top:
            top = self.config.indicatorMargin
        case .center:
            top = (cell.frame.height - height) * 0.5
        case .bottom:
            top = cell.frame.height - self.config.indicatorMargin - height
        default: break
        }
        let rect = CGRect(x: left, y: top, width: width, height: height)
        self.indicatorRects.updateValue(rect, forKey: index)
        return rect
    }
    /// 设置选中项
    func setSelectedCell(cell: GXSegmentTitleCell?, at indexPath: IndexPath, animated: Bool) {
        self.selectedIndex = indexPath.item
        let seleIndexPath = IndexPath(item: self.selectedIndex, section: 0)
        let seleCell = self.collectionView.cellForItem(at: seleIndexPath) as? GXSegmentTitleCell
        for subCell in self.collectionView.visibleCells {
            if subCell == cell {
                (subCell as? GXSegmentTitleCell)?.updateCellTitle(isChecked: true, animated: animated)
            }
            else if subCell == seleCell {
                (subCell as? GXSegmentTitleCell)?.updateCellTitle(isChecked: false, animated: animated)
            }
            else {
                (subCell as? GXSegmentTitleCell)?.updateCellTitle(isChecked: false, animated: false)
            }
        }
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated:animated)
    }
    func setSelectedCell(at index: Int, animated: Bool) {
        let indexPath = IndexPath(item: index, section: 0)
        let cell = collectionView.cellForItem(at: indexPath) as? GXSegmentTitleCell
        self.setSelectedCell(cell: cell, at: indexPath, animated: animated)
    }
    /// 设置滚动条
    func setSelectedIndicator(cell: GXSegmentTitleCell, at index: Int, animated: Bool) {
        let indicatorFrame = self.rectIndicator(cell: cell, index: index)
        if animated {
            UIView.animate(withDuration: self.config.indicatorDuration) {
                self.indicator.frame = indicatorFrame
            }
        } else {
            self.indicator.frame = indicatorFrame
        }
    }
    func setSelectedIndicator(at index: Int, animated: Bool) {
        let indexPath = IndexPath(item: index, section: 0)
        let cell = collectionView.cellForItem(at: indexPath) as? GXSegmentTitleCell
        guard cell != nil else { return }
        self.setSelectedIndicator(cell: cell!, at: index, animated: animated)
    }
    /// 联动视图调用
    func scrollTo(selectIndex: Int, willSelectIndex: Int, progress: CGFloat) {
        let seleIndexPath = IndexPath(item: selectIndex, section: 0)
        let willIndexPath = IndexPath(item: willSelectIndex, section: 0)
        let seleCell = collectionView.cellForItem(at: seleIndexPath) as? GXSegmentTitleCell
        let willCell = collectionView.cellForItem(at: willIndexPath) as? GXSegmentTitleCell
        seleCell?.updateCellTitle(progress: progress, isWillSelected: false)
        willCell?.updateCellTitle(progress: progress, isWillSelected: true)
        if progress >= 0.9 {
            self.setSelectedCell(cell: willCell, at: willIndexPath, animated: true)
        }
        else if progress <= 0.1 {
            self.setSelectedCell(cell: seleCell, at: seleIndexPath, animated: true)
        }
        guard seleCell != nil && willCell != nil else { return }
        
        let seleFrame = self.rectIndicator(cell: seleCell!, index: selectIndex)
        let willFrame = self.rectIndicator(cell: willCell!, index: willSelectIndex)
        if self.config.indicatorStyle == .none {
            if progress > 0.9 {
                UIView.animate(withDuration: self.config.indicatorDuration) {
                    self.indicator.frame = willFrame
                }
            }
            else {
                UIView.animate(withDuration: self.config.indicatorDuration) {
                    self.indicator.frame = seleFrame
                }
            }
        }
        else if self.config.indicatorStyle == .half {
            if progress >= 0.5 {
                UIView.animate(withDuration: self.config.indicatorDuration) {
                    self.indicator.frame = willFrame
                }
            }
            else {
                UIView.animate(withDuration: self.config.indicatorDuration) {
                    self.indicator.frame = seleFrame
                }
            }
        }
        else if self.config.indicatorStyle == .follow {
            let differenceW = willFrame.width - seleFrame.width
            let differenceX = willFrame.origin.x - seleFrame.origin.x
            let left = seleFrame.origin.x + differenceX * progress
            let width = seleFrame.width + differenceW * progress
            let frame = CGRect(x: left, y: seleFrame.origin.y, width: width, height: seleFrame.height)
            self.indicator.frame = frame
        }
        else if self.config.indicatorStyle == .dynamic {
            if selectIndex < willSelectIndex {
                // 往左滑动
                if progress <= 0.5 {
                    let differenceX = seleFrame.width * 0.5
                    let left = seleFrame.origin.x + differenceX * progress * 2
                    let centerW = willFrame.midX - seleFrame.midX
                    let differenceW = centerW - seleFrame.width
                    let width = seleFrame.width + differenceW * progress * 2
                    let frame = CGRect(x: left, y: seleFrame.origin.y, width: width, height: seleFrame.height)
                    self.indicator.frame = frame
                }
                else {
                    let differenceX = willFrame.origin.x - seleFrame.midX
                    let left = willFrame.origin.x - differenceX * (1.0 - progress) * 2
                    let centerW = willFrame.midX - seleFrame.midX
                    let differenceW = willFrame.width - centerW
                    let width = willFrame.width + (progress - 1.0) * differenceW * 2
                    let frame = CGRect(x: left, y: seleFrame.origin.y, width: width, height: seleFrame.height)
                    self.indicator.frame = frame
                }
            }
            else {
                // 往右滑动
                if progress <= 0.5 {
                    let differenceX = seleFrame.origin.x - willFrame.midX
                    let left = seleFrame.origin.x - differenceX * progress * 2
                    let centerW = seleFrame.midX - willFrame.midX
                    let differenceW = centerW - seleFrame.width
                    let width = seleFrame.width + differenceW * progress * 2
                    let frame = CGRect(x: left, y: seleFrame.origin.y, width: width, height: seleFrame.height)
                    self.indicator.frame = frame
                }
                else {
                    let differenceX = willFrame.width * 0.5
                    let left = willFrame.origin.x + differenceX * (1.0 - progress) * 2
                    let centerW = seleFrame.midX - willFrame.midX
                    let differenceW = centerW - willFrame.width
                    let width = willFrame.width + differenceW * (1.0 - progress) * 2
                    let frame = CGRect(x: left, y: seleFrame.origin.y, width: width, height: seleFrame.height)
                    self.indicator.frame = frame
                }
            }
        }
    }
}

extension GXSegmentTitleView: UICollectionViewDataSource {
    // MARK: - UICollectionViewDataSource
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.titles.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: GXSegmentTitleCell = collectionView.dequeueReusableCell(withReuseIdentifier: GXCellID, for: indexPath) as! GXSegmentTitleCell
        let isMaxItem = indexPath.item == (self.titles.count - 1)
        cell.setCell(config: self.config, title: self.titles[indexPath.item], isMaxItem: isMaxItem)
        cell.isChecked = (indexPath.item == self.selectedIndex)
        
        return cell
    }
}

extension GXSegmentTitleView: UICollectionViewDelegateFlowLayout {
    // MARK: - UICollectionViewDelegate
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! GXSegmentTitleCell
        self.setSelectedCell(cell: cell, at: indexPath, animated: true)
        self.setSelectedIndicator(cell: cell, at: indexPath.row, animated: true)
        if delegate?.responds(to: #selector(delegate?.segmentTitleView(_:at:))) ?? false {
            self.delegate?.segmentTitleView?(self, at: indexPath.item)
        }
    }
    // MARK: - UICollectionViewDelegateFlowLayout
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.cellSize(cellForAt: indexPath.item)
    }
}
