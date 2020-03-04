//
//  NNButtonGroupView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/3/2.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

/// UIButton集合视图
class NNButtonGroupView: UIView {

    var cornerRadius: CGFloat = 5.0
    var borderWidth: CGFloat = 0.5
    var fontSize: CGFloat = 15

    var numberOfRow: Int = 4
    var padding: CGFloat = 5.0
    var lineColor: UIColor = UIColor.line
    var titleColor: UIColor = UIColor.gray

    var isMutiChoose: Bool = false
    var selectedList: [NNIconButton] = []
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

    var items:[String]?
    {
        willSet{
            itemList.removeAll()
            subviews.forEach { (subview) in
                subview.removeFromSuperview()
            }
            
            for e in newValue!.enumerated() {
                let view: NNIconButton = NNIconButton.createBtn(rect: .zero, title: e.element, tag: e.offset);
                view.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
                view.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
                addSubview(view)
                
                itemList.append(view)
            }
        }
    }
    
    @objc func handleAction(_ sender: NNIconButton) {
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
        
        if viewBlock != nil {
            viewBlock!(self, sender)
        }
    }
    
    var viewBlock: ((NNButtonGroupView, NNIconButton) -> Void)?
    var itemList: [NNIconButton] = []{
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
    
    func block(_ action: @escaping ((NNButtonGroupView, NNIconButton) -> Void)) {
        viewBlock = action;
    }

}

extension UIButton {
        
   static func createBtn(rect:CGRect, title: String!, tag: NSInteger) -> Self {
    let view = Self.init(type:.custom);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.imageView?.contentMode = .scaleAspectFit
        view.frame = rect;
        view.setTitle(title, for: .normal);
        view.setTitleColor(.black, for: .normal);
        //        view.backgroundColor = UIColor.theme;

        view.isExclusiveTouch = true;
        view.adjustsImageWhenHighlighted = false;
        view.tag = tag;
        return view as Self;
    }
}

class NNIconButton: UIButton {
        
    lazy var iconImageView: UIImageView = {
        let view = UIImageView(frame: CGRect.zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true;
        view.contentMode = .scaleAspectFit;
//        view.image = UIImage(named: "icon_discount_orange");
        return view
    }()
    
    var iconSize: CGSize = CGSize(width: 35, height: 14)
    
    var locationXY: String = "0,1"
    
    // MARK: -life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(iconImageView)
        
        clipsToBounds = false
        titleLabel!.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
//        return
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
                
        if bounds.height <= 0.0 {
            return
        }
        
        switch locationXY {
        case "0,0"://左上
            iconImageView.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(-2.0)
                make.left.equalToSuperview().offset(-2.0)
                make.size.equalTo(iconSize)
            }
            
        case "0,1"://右上
            iconImageView.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(-2.0)
                make.right.equalToSuperview().offset(2.0)
                make.size.equalTo(iconSize)
            }
            
        case "1,0"://左下
            iconImageView.snp.makeConstraints { (make) in
                make.bottom.equalToSuperview().offset(2.0)
                make.left.equalToSuperview().offset(-2.0)
                make.size.equalTo(iconSize)
            }
            
        case "1,1"://右下
            iconImageView.snp.makeConstraints { (make) in
                make.bottom.equalToSuperview().offset(2.0)
                make.right.equalToSuperview().offset(2.0)
                make.size.equalTo(iconSize)
            }
            
        default:
            break;
        }
    }
    

}
