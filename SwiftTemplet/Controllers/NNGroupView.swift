//
//  NNGroupView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/11/15.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand

enum NNGroupViewShowType : Int {
    case backgroud
    case line
}

class NNGroupView: UIView {

    var showType: NNGroupViewShowType = .line

    var cornerRadius: CGFloat = 5.0
    var numberOfRow: Int = 4
    var padding: CGFloat = 5.0
    var lineColor: UIColor = UIColor.line
    var titleColor: UIColor = UIColor.gray;

    var isMutiChoose: Bool = false;
    var selectedList: [UIButton] = []
    var selectedIdxList: [Int] {
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
    
    func changeStatue(_ btn: UIButton, showType: NNGroupViewShowType) {
        switch self.showType {
        case .backgroud:
            btn.setTitleColor(titleColor, for: .normal)
            btn.setBackgroundImage(UIImageColor(.white), for: .normal)
            
            btn.setTitleColor(.white, for: .selected)
            btn.setBackgroundImage(UIImageColor(.theme), for: .selected)

        default:
            break;
        }
        
        btn.layer.borderWidth = 1;
       if btn.isSelected == true {
           btn.setTitleColor(UIColor.theme, for: .normal)
           btn.layer.borderColor = UIColor.theme.cgColor;
       } else {
           btn.setTitleColor(titleColor, for: .normal)
           btn.layer.borderColor = lineColor.cgColor;
       }
    }
    
    @objc func handleAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        changeStatue(sender, showType: showType)
        if sender.isSelected == true {
            if self.isMutiChoose == false {
                for e in selectedList.enumerated() {
                    e.element.isSelected = false;
                    changeStatue(e.element, showType: showType)
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
    
    var viewBlock: ((NNGroupView, UIControl) -> Void)?
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
            if self.cornerRadius > 0 {
                view.layer.cornerRadius = self.cornerRadius;
                view.layer.masksToBounds = true;
            }
            changeStatue(view, showType: showType)
            view.isSelected = selectedList.contains(view);
         
        }
    }
    
    // MARK: -funtions
    func itemViewHeight(_ itemHeight: CGFloat = 40) -> CGFloat {
        let rowCount = itemList.count % numberOfRow == 0 ? itemList.count/numberOfRow : itemList.count/numberOfRow + 1;
        return rowCount.toCGFloat * itemHeight + (rowCount - 1).toCGFloat * padding;
    }
    
    func block(_ action: @escaping ((NNGroupView, UIControl) -> Void)) {
        viewBlock = action;
    }
    
    func createBtn(rect:CGRect, title: String!, tag: NSInteger) -> UIButton {
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
