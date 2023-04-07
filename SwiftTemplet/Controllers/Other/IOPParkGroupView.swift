//
//  IOPParkGroupView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/11/15.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand


class IOPParkGroupView: UIView {

    var cornerRadius: CGFloat = 0
    var numberOfRow: Int = 4
    var padding: CGFloat = 5.0

    var isMutiChoose: Bool = false;
    var isLeaveOne: Bool = true;

    var hideImage: Bool = false;

    var selectedList: [UIButton] = []
    var selectedIdxList: [Int]{
        get {
            return selectedList.map{ $0.tag };
        }
        set {
            if newValue.count <= 0 {
                return;
            }
            if isMutiChoose == false && newValue.count > 1 {
                fatalError("单选只能默认选择索引应该为单选");
            }
            
            selectedList.removeAll();
            for e in itemList.enumerated() {
                e.element.isSelected = newValue.contains(e.offset)
                if newValue.contains(e.offset) == true {
                    selectedList.append(e.element)
                }
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
    
    func changeStatue(_ btn: UIButton) {
        btn.setTitleColor(.black, for: .normal)
        btn.setBackgroundImage(UIImage(color: UIColor.hexValue(0xF3F3F3)), for: .normal)
        
        btn.setTitleColor(.theme, for: .selected)
        btn.setBackgroundImage(UIImage(color: UIColor.hexValue(0xDEF0FF)), for: .selected)
        
        if hideImage == false {
            btn.setImage(UIImage(color: UIColor.hexValue(0xF3F3F3)), for: .normal)
            btn.setImage(UIImage(named: "icon_choose_blue"), for: .selected)
        }
    }
    
    @objc func handleAction(_ sender: UIButton) {
        if selectedList.count == 1 && isLeaveOne == true && selectedList.first == sender {
            return;
        }
        sender.isSelected = !sender.isSelected;
        if sender.isSelected == true {
            if isMutiChoose == false {
                for e in selectedList.enumerated() {
                    e.element.isSelected = false;
                    changeStatue(e.element)
                }
                selectedList.removeAll()
            }
            selectedList.append(sender)
        } else {
            if selectedList.contains(sender) == true {
                selectedList.remove(at: selectedList.firstIndex(of: sender)!)
            }
        }
//        print(sender.isSelected, self.selectedList)
        self.viewBlock?(self,  sender)
    }
    
    var viewBlock: ((IOPParkGroupView, UIControl) -> Void)?
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
            let x = CGFloat(e.offset % numberOfRow) * (itemWidth + padding)
            let y = CGFloat(e.offset / numberOfRow) * (itemHeight + padding)
            let rect = CGRect(x: x, y: y, width: itemWidth, height: itemHeight)
            
            let view = e.element;
            view.frame = rect;
            if cornerRadius > 0 {
                view.layer.cornerRadius = cornerRadius;
                view.layer.masksToBounds = true;
            }
            changeStatue(view)
            view.isSelected = selectedList.contains(view);
            
        }
    }
    
    // MARK: -funtions
    func itemViewHeight(_ itemHeight: CGFloat = 40) -> CGFloat {
        let rowCount = itemList.count % numberOfRow == 0 ? itemList.count/numberOfRow : itemList.count/numberOfRow + 1;
        return rowCount.cgFloatValue * itemHeight + (rowCount - 1).cgFloatValue * padding;
    }
    
    func block(_ action: @escaping ((IOPParkGroupView, UIControl) -> Void)) {
        viewBlock = action;
    }
    
    func createBtn(rect: CGRect, title: String, tag: NSInteger) -> IOPParkButton {
        let view = IOPParkButton(type:.custom);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.imageView?.contentMode = .scaleAspectFit
        view.frame = rect;
        view.setTitle(title, for: .normal);
        view.setTitleColor(.black, for: .normal);
        view.titleLabel?.font = UIFont.systemFont(ofSize: 13)
//        view.backgroundColor = UIColor.theme;

        view.isExclusiveTouch = true;
        view.adjustsImageWhenHighlighted = false;
        view.tag = tag;
        
        return view;
    
    }
}
