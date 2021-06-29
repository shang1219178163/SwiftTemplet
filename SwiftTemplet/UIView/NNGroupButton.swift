//
//  NNGroupButton.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/9.
//  Copyright © 2021 BN. All rights reserved.
//


/// UIButton集合视图
@objcMembers class NNGroupButton: UIView {

    public var block: ((NNGroupButton, UIButton) -> Void)?

    public var numberOfRow: Int = 4
    public var padding: CGFloat = 5.0
    public var edge: UIEdgeInsets = .zero

    public var isMutiChoose: Bool = false

    public var items: [UIButton] = []
    {
        willSet{
            subviews.forEach { (sender) in
                sender.removeFromSuperview()
            }
            
            newValue.enumerated().forEach { (e) in
                self.addSubview(e.element)
                e.element.tag = e.offset
                e.element.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
            }
        }
    }
    
    private var indexs: [Int] = []
    ///预选索引集合
    public var itemsIndexs: [Int] {
        set{
            indexs = newValue
        }
        get{
            return items.filter { $0.isSelected == true }.map { $0.tag }
        }
    }
    ///不可点击索引集合
    public var disabledIndexs: [Int] = []

    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        items.forEach { (sender) in
            sender.isSelected = indexs.contains(sender.tag)
            sender.alpha = disabledIndexs.contains(sender.tag) ? 0.5 : 1
        }

        items.updateItemsConstraint(bounds, numberOfRow: numberOfRow, minimumInteritemSpacing: padding, minimumLineSpacing: padding, sectionInset: edge, showStyle: .topLeftToRight)
    }
    
    
    // MARK: -funtions
    @objc  func handleAction(_ sender: UIButton) {
        if disabledIndexs.contains(sender.tag) {
            print(#function, "不可用索引:\(sender.tag), disabledIndexs:\(disabledIndexs)")
            return
        }
        if isMutiChoose == true {
            sender.isSelected = !sender.isSelected;
            block?(self, sender)
            return
        }
        
        items.forEach { (e) in
            e.isSelected = (e == sender);
        }
        block?(self, sender)
    }
    

}

