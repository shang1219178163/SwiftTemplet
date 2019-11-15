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
                    changeStatue(e.element, showType: showType)
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
        switch showType {
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
        
        if sender.isSelected == true {
//            sender.setTitleColor(UIColor.theme, for: .normal)
//            sender.layer.borderColor = UIColor.theme.cgColor;
            changeStatue(sender, showType: showType)

            if isMutiChoose == false {
                selectedList.removeAll()
                for e in selectedList.enumerated() {
                    e.element.isSelected = false;
                    changeStatue(e.element, showType: showType)
                }
            }
            selectedList.append(sender)
            selectedIdxList.append(sender.tag)
        } else {
            changeStatue(sender, showType: showType)

            if selectedList.contains(sender) == true {
                selectedList.remove(at: selectedList.firstIndex(of: sender)!)
                selectedIdxList.remove(at: selectedIdxList.firstIndex(of: sender.tag)!)
            }
        }
//        print(sender.isSelected, selectedList)
        
        if viewBlock != nil {
            viewBlock!(self, sender)
        }
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
            if cornerRadius > 0 {
                view.layer.cornerRadius = cornerRadius;
                view.layer.masksToBounds = true;
            }
            
            view.isSelected = selectedList.contains(view);
            changeStatue(view, showType: showType)
//            if selectedList.contains(view) == true {
//                view.setTitleColor(UIColor.theme, for: .normal)
//                view.layer.borderColor = UIColor.theme.cgColor;
//            } else {
//                view.setTitleColor(titleColor, for: .normal)
//                view.layer.borderColor = lineColor.cgColor;
//            }
         
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
