//
//  NNItemsView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/18.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class NNItemsView: UIView {

    var cornerRadius: CGFloat = 5.0
    var numberOfRow: Int = 4
    var padding: CGFloat = 5.0
    var lineColor: UIColor = UIColor.line

    var isMutiChoose: Bool = false;
    var selectedList: [UIButton] = []
    var selectedIdxList: [Int] = []{
        willSet{
            if newValue.count <= 0 {
                return;
            }
            if isMutiChoose == false && newValue.count > 1 {
                fatalError("单选只能默认选择索引应该为单选");
            }
        }
    }

    var items:[String]?
    {
        willSet{
            itemList.removeAll()
            subviews.forEach { (subview) in
                subview.removeFromSuperview()
            }
            
            for e in newValue!.enumerated() {
                let view = createBtn(rect: .zero, title: e.element, tag: e.offset);
                view.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
                addSubview(view)
                
                itemList.append(view)
            }
        }
    }
    
    @objc func handleAction(_ sender: UIButton) -> Void {
        sender.isSelected = !sender.isSelected;
        
        if sender.isSelected == true {
            sender.setTitleColor(UIColor.theme, for: .normal)
            sender.layer.borderColor = UIColor.theme.cgColor;
            if self.isMutiChoose == false {
                for e in self.selectedList.enumerated() {
                    e.element.isSelected = false;
                    e.element.setTitleColor(UIColor.gray, for: .normal)
                    e.element.layer.borderColor = lineColor.cgColor;
                }
                self.selectedList.removeAll()
                self.selectedList.append(sender)
            } else {
                self.selectedList.append(sender)
            }
        } else {
            sender.setTitleColor(UIColor.gray, for: .normal)
            sender.layer.borderColor = lineColor.cgColor;
            if self.selectedList.contains(sender) == true {
                self.selectedList.remove(at: self.selectedList.firstIndex(of: sender)!)
            }
        }
        print(sender.isSelected, self.selectedList)
        
        if self.viewBlock != nil {
            self.viewBlock!(self, sender)
        }
    }
    
    var viewBlock: ((NNItemsView, UIControl) -> Void)?
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
    
    func setupConstraint() -> Void {
        if itemList.count == 0 || bounds.width <= 0 {
            return;
        }
        
        let rowCount = itemList.count % numberOfRow == 0 ? itemList.count/numberOfRow : itemList.count/numberOfRow + 1;
        let itemWidth = (bounds.width - CGFloat(numberOfRow - 1)*padding)/CGFloat(numberOfRow)
        let itemHeight = (bounds.height - CGFloat(rowCount - 1)*padding)/CGFloat(rowCount)
        
        for e in itemList.enumerated() {
            let x = CGFloat(e.offset % numberOfRow) * (itemWidth + padding)
            let y = CGFloat(e.offset / numberOfRow) * (itemHeight + padding)
            let rect = CGRect(x: x, y: y, width: itemWidth, height: itemHeight)
            
            let view = e.element;
            view.frame = rect;
            if self.cornerRadius > 0 {
                view.layer.cornerRadius = self.cornerRadius;
                view.layer.masksToBounds = true;
            }
            
            view.layer.borderWidth = 1;
            if selectedList.contains(view) == true {
                view.setTitleColor(UIColor.theme, for: .normal)
                view.layer.borderColor = UIColor.theme.cgColor;
            } else {
                view.setTitleColor(UIColor.gray, for: .normal)
                view.layer.borderColor = lineColor.cgColor;
            }
         
        }
    }
    
    // MARK: -funtions
    func itemViewHeight(_ itemHeight: CGFloat = 40) -> CGFloat {
        let rowCount = itemList.count % numberOfRow == 0 ? itemList.count/numberOfRow : itemList.count/numberOfRow + 1;
        return rowCount.toCGFloat * itemHeight + (rowCount - 1).toCGFloat * padding;
    }
    
    func block(_ action: @escaping ((NNItemsView, UIControl) -> Void)) -> Void {
        viewBlock = action;
    }
    
    func createBtn(rect:CGRect, title: String!, tag: NSInteger) -> UIButton {
        let view = UIButton(type:.custom);
        view.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
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
