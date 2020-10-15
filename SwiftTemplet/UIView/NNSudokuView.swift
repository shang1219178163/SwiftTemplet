//
//	NNSudokuView.swift
//	MacTemplet
//
//	Created by shang on 2020/08/22 14:56
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand

///
@objcMembers class NNSudokuView: UIView {
    
    var numOfRow: Int = 3
    
    var row: Int = 3
    
    var lineSpacing: CGFloat = 10{
        willSet{
            setNeedsLayout()
        }
    }

    var interitemSpacing: CGFloat = 10{
        willSet{
            setNeedsLayout()
        }
    }

    var inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10){
        willSet{
            setNeedsLayout()
        }
    }

    var itemType: UIButton.Type = UIButton.self{
        willSet{
            setNeedsLayout()
        }
    }

    lazy var items: [UIButton] = {
        return self.updateItems(self.row*self.numOfRow, type: self.itemType) {
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            $0.setTitle("\(self.itemType)\($0.tag)", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
        }
    }()
    // MARK: -分隔符号
    var showDividers = false
    var dividerColor: UIColor = .line
    var dividerWidth: CGFloat = 1
    var dividerSpacing: CGFloat = 5
    
    lazy var dividers: [UIImageView] = {
        return self.updateItems(self.row*self.numOfRow, type: UIImageView.self) {
            $0.backgroundColor = self.dividerColor
        }
    }()

    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10 {
            return;
        }
        
        if numOfRow == 1 {
            items.snp.distributeViewsAlong(axisType: .vertical, fixedSpacing: 0, leadSpacing: inset.top, tailSpacing: inset.bottom)
            items.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(inset.left)
                make.right.equalToSuperview().offset(-inset.right)
            }
            return
        }
        
        if row == 1 {
            items.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: interitemSpacing, leadSpacing: inset.left, tailSpacing: inset.right)
            items.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top)
                make.bottom.equalToSuperview().offset(-inset.bottom)
            }
            
            handleDivers()
            return
        }

        items.snp.distributeSudokuViews(fixedLineSpacing: lineSpacing, fixedInteritemSpacing: interitemSpacing, warpCount: numOfRow, edgeInset: inset)
        
        handleDivers()
    }
    
    // MARK: -funtions
    func handleDivers() {
        if showDividers == false {
            return
        }
//        let rowCount = items.count % numOfRow == 0 ? items.count/numOfRow : items.count/numOfRow + 1;
        let rowCount = row
        let itemWidth = (bounds.width - CGFloat(numOfRow - 1)*interitemSpacing - inset.left - inset.right)/CGFloat(numOfRow)
        let itemHeight = (bounds.height - CGFloat(rowCount - 1)*lineSpacing - inset.top - inset.bottom)/CGFloat(rowCount)
        
        for e in items.enumerated() {
            let x = CGFloat(e.offset % numOfRow) * (itemWidth + interitemSpacing) + inset.left
            let y = CGFloat(e.offset / numOfRow) * (itemHeight + lineSpacing) + inset.top
//            let rect = CGRect(x: x, y: y, width: itemWidth, height: itemHeight)
            
            dividers[e.offset].frame = CGRect(x: x + itemWidth + interitemSpacing*0.5,
                                              y: y + dividerSpacing,
                                              width: dividerWidth,
                                              height: itemHeight - dividerSpacing*2)
            dividers[e.offset].isHidden = (e.offset % numOfRow == (numOfRow - 1))
        }
    }

    func show() {
        UIApplication.shared.keyWindow?.endEditing(true)
        UIApplication.shared.keyWindow?.addSubview(self);
        
//        self.transform = self.transform.scaledBy(x: 1.5, y: 1.5)
        UIView.animate(withDuration: 0.15, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0.6);
            self.transform = CGAffineTransform.identity

        }, completion: nil);
    }

    func dismiss() {
        UIView.animate(withDuration: 0.15, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0);

        }) { (isFinished) in
            self.removeFromSuperview();
        }
    }
        

}
