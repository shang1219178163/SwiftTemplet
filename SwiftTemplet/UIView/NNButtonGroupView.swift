//
//  NNButtonGroupView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/3/2.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

@objc protocol NNButtonGroupViewDelegate{
    @objc func buttonGroupView(_ view: NNButtonGroupView, sender: UIButton);
}

/// UIButton集合视图
@objcMembers class NNButtonGroupView: UIView {

    weak var delegate: NNButtonGroupViewDelegate?

    var cornerRadius: CGFloat = 5.0
    var borderWidth: CGFloat = 0.5
    var fontSize: CGFloat = 15

    var numberOfRow: Int = 4
    var padding: CGFloat = 5.0
    var lineColor: UIColor = .line
    var titleColor: UIColor = .gray
    var backgroudImage: UIImage = UIImage(color: .white)
    var backgroudColor: UIColor = .white{
        willSet{
            backgroudImage = UIImage(color: newValue)
        }
    }
    
    var selectedLineColor: UIColor = .theme
    var selectedTitleColor: UIColor = .theme
    var selectedBackgroudImage: UIImage = UIImage(color: .white)
    var selectedBackgroudColor: UIColor = .white{
        willSet{
            selectedBackgroudImage = UIImage(color: newValue)
        }
    }

//    var selectedLineColor: UIColor = .theme
//    var selectedTitleColor: UIColor = .white
//    var selectedBackgroudColor: UIColor = .theme
    
    var iconSize: CGSize = CGSize(width: 35, height: 14)
    
    var iconLocation: UIView.Location = .rightTop

    var hasLessOne: Bool = false
    var isMutiChoose: Bool = false
    var hideImage: Bool = false;

    var selectedList: [UIButton] = []
    var selectedIdxList: [Int] = []{
        willSet{
            if newValue.count <= 0 {
                return;
            }
            if isMutiChoose == false && newValue.count > 1 {
                fatalError("单选只能默认选择索引应该为单选");
            }
            selectedList.removeAll()
            for e in itemList.enumerated() {
                if newValue.contains(e.offset) == true {
                    selectedList.append(e.element)
                    
                    e.element.isSelected = true;
                    e.element.layer.borderColor = e.element.isSelected ? selectedLineColor.cgColor : lineColor.cgColor
                }
            }
        }
    }
    
    var showStyle: ShowStyle = .topLeftToRight

    var items: [String]?{
        willSet{
            guard let newValue = newValue, items != newValue else { return }
            createItems(newValue)
        }
    }
    
    var itemList: [UIButton] {
        guard let list = self.subviews.filter({$0.isKind(of: UIButton.self) }) as? [UIButton] else { return []}
        return list
    }
    
    var viewBlock: ((NNButtonGroupView, UIButton) -> Void)?
    
    @objc func handleAction(_ sender: UIButton) {
//        print("NNButtonGroupView_\(hasLessOne)_\(selectedList.count)_\(sender.isSelected)")
        if hasLessOne == true && selectedList.count == 1 && sender.isSelected == true {
            print("最少选择一个")
            return
        }
        sender.isSelected = !sender.isSelected;
        
        if sender.isSelected == true {
            sender.layer.borderColor = sender.isSelected ? selectedLineColor.cgColor : lineColor.cgColor
            if isMutiChoose == false {
                for e in selectedList.enumerated() {
                    e.element.isSelected = false;
                    e.element.layer.borderColor = e.element.isSelected ? selectedLineColor.cgColor : lineColor.cgColor
                }
                selectedList.removeAll()
                selectedIdxList.removeAll()
            }
            selectedList.append(sender)
            selectedIdxList.append(sender.tag)
        } else {
            sender.layer.borderColor = sender.isSelected ? selectedLineColor.cgColor : lineColor.cgColor
            if selectedList.contains(sender) == true {
                selectedList.remove(at: selectedList.firstIndex(of: sender)!)
            }
            if selectedIdxList.contains(sender.tag) == true {
                selectedIdxList.remove(at: selectedIdxList.firstIndex(of: sender.tag)!)
            }
        }
//        print(sender.isSelected, selectedList)
        delegate?.buttonGroupView(self, sender: sender)
        viewBlock?(self, sender)
    }
    

    // MARK: -lifecycle
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
            var rect = CGRect(x: x, y: y, width: itemWidth, height: itemHeight)
            
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
            
            view.isSelected = (selectedList.contains(view))
            view.layer.borderWidth = borderWidth;
            view.layer.borderColor = view.isSelected ? selectedLineColor.cgColor : lineColor.cgColor
        }
    }
    
    // MARK: -funtions
    func itemViewHeight(_ itemHeight: CGFloat = 40) -> CGFloat {
        let rowCount = itemList.count % numberOfRow == 0 ? itemList.count/numberOfRow : itemList.count/numberOfRow + 1;
        return rowCount.toCGFloat * itemHeight + (rowCount - 1).toCGFloat * padding;
    }
    
    func block(_ action: @escaping ((NNButtonGroupView, UIButton) -> Void)) {
        viewBlock = action;
    }
    
    func createItems(_ titles: [String]) {
        subviews.forEach { (subview) in
            subview.removeFromSuperview()
        }

        for e in titles.enumerated() {
            let view = NNIconButton.createBtn(rect: .zero, title: e.element, tag: e.offset);
            view.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
            view.setTitleColor(titleColor, for: .normal)
            view.setTitleColor(selectedTitleColor, for: .selected)
            view.setBackgroundImage(backgroudImage, for: .normal)
            view.setBackgroundImage(selectedBackgroudImage, for: .selected)

            view.iconSize = iconSize
            view.iconLocation = iconLocation
            view.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
            addSubview(view)
        }
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

        view.isExclusiveTouch = true;
        view.adjustsImageWhenHighlighted = false;
        view.tag = tag;
        return view as Self;
    }
}

extension NNButtonGroupView{
    
    ///创建各种子类按钮
    final func create<T: UIButton>(_ titles: [String], type: T.Type) {
        if let btns: [UIButton] = subviews.filter({ $0.isKind(of: UIButton.self) }) as? [UIButton],
            let items = btns.map({ $0.currentTitle ?? "" }) as [String]?{
            if titles == items {
                return
            }
        }

        subviews.forEach { (subview) in
            subview.removeFromSuperview()
        }
        
        for e in titles.enumerated() {
            let view: T = T.createBtn(rect: .zero, title: e.element, tag: e.offset);
            view.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
            view.setTitleColor(titleColor, for: .normal)
            view.setTitleColor(selectedTitleColor, for: .selected)
            view.setBackgroundImage(backgroudImage, for: .normal)
            view.setBackgroundImage(selectedBackgroudImage, for: .selected)
            
            view.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
            addSubview(view)
        }
    }
}
