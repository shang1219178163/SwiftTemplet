//
//  NNItemsView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/18.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class NNItemsView: UIView {

    var numberOfRow: Int = 4
    var padding: CGFloat = 5.0
    var items:[String]?
    {
        willSet{
            itemList.removeAll()
            subviews.forEach { (subview) in
                subview.removeFromSuperview()
            }
            
            for e in newValue!.enumerated() {
                let view = createBtn(rect: .zero, title: e.element, tag: e.offset);
                view.addActionHandler({ (sender) in
                    if self.viewBlock != nil {
                        self.viewBlock!(self, sender)
                    }
                }, for: .touchUpInside)
                addSubview(view)
                
                itemList.append(view)
            }
        }
    }
//    var type :Int = 0
    
    var viewBlock: ((NNItemsView, UIControl) -> Void)?
    var itemList: [UIButton] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
                
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if items != nil {
            setupConstraint()
        }
    }
    
    func setupConstraint() -> Void {
        let rowCount = items!.count % numberOfRow == 0 ? items!.count/numberOfRow : items!.count/numberOfRow + 1;
        let itemWidth = (bounds.width - CGFloat(numberOfRow - 1)*padding)/CGFloat(numberOfRow)
        let itemHeight = (bounds.height - CGFloat(rowCount - 1)*padding)/CGFloat(rowCount)
        
        for e in items!.enumerated() {
            let x = CGFloat(e.offset % numberOfRow) * (itemWidth + padding)
            let y = CGFloat(e.offset / numberOfRow) * (itemHeight + padding)
            let rect = CGRect(x: x, y: y, width: itemWidth, height: itemHeight)
            
            let view = self.itemList[e.offset];
            view.frame = rect;
        }
    }
    
//    func setupConstraint() -> Void {
//
//        let rowCount = items!.count % numberOfRow == 0 ? items!.count/numberOfRow : items!.count/numberOfRow + 1;
//        let itemWidth = (bounds.width - CGFloat(numberOfRow - 1)*padding)/CGFloat(numberOfRow)
//        let itemHeight = (bounds.height - CGFloat(rowCount - 1)*padding)/CGFloat(rowCount)
//
//        for e in items!.enumerated() {
//            let x = CGFloat(e.offset % numberOfRow) * (itemWidth + padding)
//            let y = CGFloat(e.offset / numberOfRow) * (itemHeight + padding)
//            let rect = CGRect(x: x, y: y, width: itemWidth, height: itemHeight)
//
//            let view = createBtn(rect: rect, title: e.element, tag: e.offset);
//            view.backgroundColor = UIColor.theme;
//            view.addActionHandler({ (sender) in
//                if self.viewBlock != nil {
//                    self.viewBlock!(self, sender)
//                }
//            }, for: .touchUpInside)
//            addSubview(view)
//        }
//    }
    
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
