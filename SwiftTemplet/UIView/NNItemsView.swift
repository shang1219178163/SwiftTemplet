//
//  NNItemsView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/18.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit


@objc protocol NNItemsViewDelegate{
    @objc func itemsView(_ view: NNItemsView, sender: UIButton);
}

@objc enum ShowStyle: Int {
    case topLeftToRight
    case topRightToLeft
    case bottomLeftToRight
    case bottomRightToLeft
}

@objcMembers class NNItemsView: UIView {

    weak var delegate: NNItemsViewDelegate?

    var cornerRadius: CGFloat = 5.0
    var borderWidth: CGFloat = 0.5
    var fontSize: CGFloat = 15

    var numberOfRow: Int = 4
    var padding: CGFloat = 5.0
    var lineColor: UIColor = UIColor.line
    var titleColor: UIColor = UIColor.gray

    var isMutiChoose: Bool = false
    var selectedList: [UIButton] = []
    var selectedIdxList: [Int] = []{
        willSet{
            if newValue.count <= 0 {
                return;
            }
            if isMutiChoose == false && newValue.count > 1 {
                fatalError("单选只能默认选择索引应该为单选");
            }
            
            for e in itemList.enumerated() {
                if newValue.contains(e.offset) == true {
                    selectedList.append(e.element)
                    
                    e.element.isSelected = true;
                    e.element.setTitleColor(UIColor.theme, for: .normal)
                    e.element.layer.borderColor = UIColor.theme.cgColor;
                }
            }
        }
    }

    var showStyle: ShowStyle = .topLeftToRight

    var items:[String]?
    {
        willSet{
            itemList.removeAll()
            subviews.forEach { (subview) in
                subview.removeFromSuperview()
            }
            
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
        sender.isSelected = !sender.isSelected;
        
        if sender.isSelected == true {
            sender.setTitleColor(UIColor.theme, for: .normal)
            sender.layer.borderColor = UIColor.theme.cgColor;
            if isMutiChoose == false {
                for e in selectedList.enumerated() {
                    e.element.isSelected = false;
                    e.element.setTitleColor(titleColor, for: .normal)
                    e.element.layer.borderColor = lineColor.cgColor;
                }
                selectedList.removeAll()
                selectedList.append(sender)
            } else {
                selectedList.append(sender)
            }
        } else {
            sender.setTitleColor(titleColor, for: .normal)
            sender.layer.borderColor = lineColor.cgColor;
            if selectedList.contains(sender) == true {
                selectedList.remove(at: selectedList.firstIndex(of: sender)!)
            }
        }
//        print(sender.isSelected, selectedList)
        delegate?.itemsView(self, sender: sender)
        viewBlock?(self, sender)
    }
    
    var viewBlock: ((NNItemsView, UIButton) -> Void)?
    var itemList: [UIButton] = []{
        willSet{
            if newValue.count <= 0 {
                return;
            }
            subviews.forEach { (subview) in
                subview.removeFromSuperview()
            }
            
            for e in newValue.enumerated() {
                addSubview(e.element)
                if selectedIdxList.contains(e.offset) == true {
                    selectedList.append(e.element);
                }
            }
            setupConstraint()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
                
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
    }
    
    func setupConstraint() {
        if itemList.count == 0 || bounds.width <= 0 {
            return;
        }
        
        let rowCount = itemList.count % numberOfRow == 0 ? itemList.count/numberOfRow : itemList.count/numberOfRow + 1;
        let itemWidth = (bounds.width - CGFloat(numberOfRow - 1)*padding)/CGFloat(numberOfRow)
        let itemHeight = (bounds.height - CGFloat(rowCount - 1)*padding)/CGFloat(rowCount)
        
        for e in itemList.enumerated() {
            let originX = CGFloat(e.offset % numberOfRow) * (itemWidth + padding)
            let originY = CGFloat(e.offset / numberOfRow) * (itemHeight + padding)
            var rect = CGRect(x: originX, y: originY, width: itemWidth, height: itemHeight)

            switch showStyle {
            case .topRightToLeft:
                rect = CGRect(x: bounds.width - originX - itemWidth,
                              y: originY,
                              width: itemWidth,
                              height: itemHeight)

            case .bottomLeftToRight:
                rect = CGRect(x: originX,
                              y: bounds.height - originY - itemHeight,
                              width: itemWidth,
                              height: itemHeight)

            case .bottomRightToLeft:
                rect = CGRect(x: bounds.width - originX - itemWidth,
                              y: bounds.height - originY - itemHeight,
                              width: itemWidth,
                              height: itemHeight)

            default:
                break
            }
            
            let view = e.element;
            view.frame = rect;
            if cornerRadius > 0 {
                view.layer.cornerRadius = cornerRadius;
                view.layer.masksToBounds = true;
            }
            
            view.layer.borderWidth = borderWidth;
            if selectedList.contains(view) == true {
                view.setTitleColor(UIColor.theme, for: .normal)
                view.layer.borderColor = UIColor.theme.cgColor;
            } else {
                view.setTitleColor(titleColor, for: .normal)
                view.layer.borderColor = lineColor.cgColor;
            }
         
        }
    }
    
    // MARK: -funtions
    func itemViewHeight(_ itemHeight: CGFloat = 40) -> CGFloat {
        let rowCount = itemList.count % numberOfRow == 0 ? itemList.count/numberOfRow : itemList.count/numberOfRow + 1;
        return rowCount.toCGFloat * itemHeight + (rowCount - 1).toCGFloat * padding;
    }
    
    func block(_ action: @escaping ((NNItemsView, UIControl) -> Void)) {
        viewBlock = action;
    }
    
    func createBtn(rect:CGRect, title: String, tag: NSInteger) -> UIButton {
        let view = UIButton(type:.custom);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.imageView?.contentMode = .scaleAspectFit
        view.frame = rect;
        view.setTitle(title, for: .normal);
        view.setTitleColor(.black, for: .normal);
//        view.backgroundColor = UIColor.theme;

        view.isExclusiveTouch = true;
        view.adjustsImageWhenHighlighted = false;
        view.tag = tag;
        return view;
    }
}
