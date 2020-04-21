//
//	NNSegmentTitleView.swift
//	MacTemplet
//
//	Created by shang on 2020/04/20 09:27
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit

import SnapKit
import SwiftExpand
        

@objc protocol NNSegmentTitleViewDelegate{
    func segmentTitleViewChangeValue(_ view: NNSegmentTitleView, sender: UIButton)
}

@objc enum IndicatorType: Int {
    case line, box
}

/// 导航栏分段按钮
@objcMembers class NNSegmentTitleView: UIView {
    
    weak var delegate: NNSegmentTitleViewDelegate?

    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue.withAlphaComponent(0.7)
        return view
    }()
    
    var indicatorType: IndicatorType = .line{
        willSet{
            switch newValue {
            case .box:
                lineView.layer.backgroundColor = UIColor.clear.cgColor
                lineView.layer.borderColor = lineColor.cgColor;
                lineView.layer.borderWidth = 1;
            default:
                lineView.layer.borderColor = UIColor.clear.cgColor;
                lineView.backgroundColor = UIColor.blue.withAlphaComponent(0.7)
            }
        }
    }

    var numberOfRow: Int = 3
    var padding: CGFloat = 8.0
    var fontSize: CGFloat = 17

    var lineHeight: CGFloat = 2.0
    var lineColor: UIColor = UIColor.line
    var titleColor: UIColor = UIColor.gray
    var selectedTitleColor: UIColor = UIColor.theme
    var selectedIndex: Int = 0

    var items:[String]?
    {
        willSet{
            itemList.removeAll()
            subviews.forEach { (subview) in
                subview.removeFromSuperview()
            }
            
            addSubview(lineView)
            for e in newValue!.enumerated() {
                let view: UIButton = createBtn(rect: .zero, title: e.element, tag: e.offset);
                view.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
                view.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
                addSubview(view)
                
                itemList.append(view)
            }
        }
    }
    
    @objc func handleAction(_ sender: UIButton) {
        selectedIndex = sender.tag

        for e in itemList.enumerated() {
            
            if e.offset == selectedIndex {
                e.element.setTitleColor(selectedTitleColor, for: .normal)
                
                UIView.animate(withDuration: 0.35) {
                    var tmpRect = self.lineView.frame
                    tmpRect.origin.x = sender.minX
                    self.lineView.frame = tmpRect;
                }
//                DDLog("\(selectedIndex)_\(lineView.frame)_\(subviews)")

            } else {
                e.element.setTitleColor(titleColor, for: .normal)
            }
         
        }
//        print(sender.isSelected, selectedList)
        delegate?.segmentTitleViewChangeValue(self, sender: sender)
    }
    
    var itemList: [UIButton] = []{
        willSet{
            if newValue.count <= 0 {
                return;
            }
            subviews.forEach { (subview) in
                subview.removeFromSuperview()
            }
            addSubview(lineView)
            for e in newValue.enumerated() {
                addSubview(e.element)
            }
            setupConstraint()
        }
    }
    
    // MARK: -life cycle
    override var intrinsicContentSize: CGSize{
        return UIView.layoutFittingExpandedSize
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(lineView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 0.0 {
            return;
        }
        setupConstraint()
    }
    
    // MARK: - funtions
    
    func setupConstraint() {
        if itemList.count == 0 || bounds.width <= 0 {
            return;
        }
        
        let rowCount = itemList.count % numberOfRow == 0 ? itemList.count/numberOfRow : itemList.count/numberOfRow + 1;
        let itemWidth = (bounds.width - CGFloat(numberOfRow - 1)*padding)/CGFloat(numberOfRow)
        let itemHeight = (bounds.height - CGFloat(rowCount - 1)*padding)/CGFloat(rowCount)
        
        for e in itemList.enumerated() {
            let x = CGFloat(e.offset % numberOfRow) * (itemWidth + padding)
            let y = CGFloat(e.offset / numberOfRow) * (itemHeight + padding)
            let rect = CGRect(x: x, y: y, width: itemWidth, height: itemHeight - 2)
            
            let view = e.element;
            view.frame = rect;
            
            if selectedIndex == e.offset {
                view.setTitleColor(selectedTitleColor, for: .normal)
                switch indicatorType {
                case .box:
                    lineView.frame = rect

                default:
                    lineView.frame = CGRect(x: 0, y: bounds.height - lineHeight, width: itemWidth, height: lineHeight)
                }
//                DDLog(lineView.frame)
            } else {
                view.setTitleColor(titleColor, for: .normal)
            }
        }
    }
    
    func createBtn(rect:CGRect, title: String!, tag: NSInteger) -> UIButton {
        let view = UIButton(type:.custom);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.imageView?.contentMode = .scaleAspectFit
        view.frame = rect;
        view.setTitle(title, for: .normal);
        view.setTitleColor(.black, for: .normal);
//        view.backgroundColor = UIColor.theme;
        view.titleLabel?.adjustsFontSizeToFitWidth = true;

        view.isExclusiveTouch = true;
        view.adjustsImageWhenHighlighted = false;
        view.tag = tag;
        return view;
    }

}
