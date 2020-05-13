//
//  NNProcessingView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/5/9.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

class NNProcessingView: UIView {
    
    var contentInset = UIEdgeInsets.zero
    
    var padding: CGFloat = 25.0
    var paddingVer: CGFloat = 10

    var index: Int = 0{
        willSet{
            for e in itemList.enumerated() {
                if newValue != 0 {
                    e.element.isSelected = (e.offset == newValue - 1)
                }
                e.element.alpha = (e.offset <= newValue) ? 1.0 : 0.3

                let lineView = separateList[e.offset]
                lineView.backgroundColor = (e.offset < newValue) ? UIColor.systemBlue : UIColor.systemBlue.withAlphaComponent(0.5)
            }
        }
    }
    
    var items: [String]?
    {
        willSet{
            itemList.removeAll()
            subviews.forEach { (subview) in
                subview.removeFromSuperview()
            }
            
            for e in newValue!.enumerated() {
                let view: UIButton = createBtn(rect: .zero, title: e.element, tag: e.offset);
                view.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
                addSubview(view)
                
                itemList.append(view)

                let lineView: UIView = UIView()
                lineView.backgroundColor = .systemBlue
                addSubview(lineView)
                
                separateList.append(lineView)
            }
        }
    }
    
    var itemList: [UIButton] = []
    
    var separateList: [UIView] = []

    
    // MARK: -life cycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
        items = ["起点", "终点"]
        
//        getViewLayer()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 0.0 {
            return
        }
        let numberOfRow: Int = itemList.count
        let itemWidth = (bounds.width - CGFloat(numberOfRow - 1)*padding - contentInset.left - contentInset.right)/CGFloat(numberOfRow)
        let itemHeight = bounds.height - 2*paddingVer - contentInset.top - contentInset.bottom
        
        for e in itemList.enumerated() {
            let originX = CGFloat(e.offset) * (itemWidth + padding) + contentInset.left
            let rect = CGRect(x: originX, y: paddingVer, width: itemWidth, height: itemHeight)
            e.element.frame = rect
            
            if e.offset != itemList.count - 1 {
                separateList[e.offset].frame = CGRect(x: rect.maxX, y: paddingVer + rect.height*0.25, width: padding, height: 2)
            }
        }
        
    }
    
    @objc func handleAction(_ sender: UIButton) {
        print("\(#function)\(sender)")
    }

    func createBtn(rect:CGRect, title: String!, tag: NSInteger) -> UIButton {
        let view = NNButton(type:.custom);
        view.direction = .top
        view.iconLocation = .leftTop
//        view.backgroundColor = UIColor.theme;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        view.setTitle(title, for: .normal);
        view.setTitleColor(UIColor.black, for: .normal)

        let normlImage: UIImage = UIImage(named: "icon_num\(tag+1)")!
        let seletedImage: UIImage = UIImage(named: "btn_selected_YES")!
        view.setImage(normlImage, for: .normal)
        view.setImage(seletedImage, for: .selected)
        
        view.isExclusiveTouch = true;
        view.adjustsImageWhenHighlighted = false;
        view.tag = tag;
        return view;
    }
}
