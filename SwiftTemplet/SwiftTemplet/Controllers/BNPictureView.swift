//
//  BNPIctureView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/3/1.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

class BNPictureView: UIView {
    
    let imageDefault = UIImage(named: "icon_pictureUpload")
    var numberOfRow: Int = 4
    var padding: CGFloat = 15
    
    var viewBlock: ((BNItemsView, UIControl) -> Void)?
    var itemList: NSMutableArray = NSMutableArray()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addPictures([imageDefault as Any])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
    }
    
    func setupConstraint() -> Void {
        let itemWidth = (bounds.width - CGFloat(numberOfRow - 1)*padding)/CGFloat(numberOfRow)
//        let rowCount = itemList.count % numberOfRow == 0 ? itemList.count/numberOfRow : itemList.count/numberOfRow + 1;
//        let itemHeight = (bounds.height - CGFloat(rowCount - 1)*padding)/CGFloat(rowCount)
        let itemHeight = itemWidth
        for e in subviews.enumerated() {
            let x = CGFloat(e.offset % numberOfRow) * (itemWidth + padding)
            let y = CGFloat(e.offset / numberOfRow) * (itemHeight + padding)
            let rect = CGRect(x: x, y: y, width: itemWidth, height: itemHeight)

            e.element.frame = rect;
        }
    }
    
    func addPictures(_ items: [Any]) -> Void {
        itemList.addObjects(from: items)
        
        itemListValueChange()
    }
    
    func deletPicture(_ item: Any) -> Void {
        itemList.remove(item)
        
        itemListValueChange()
    }
    
    func itemListValueChange() -> Void {
        subviews.forEach { (subview) in
            subview.removeFromSuperview()
        }
        
        for e in itemList.enumerated() {
            let view = createImgView(.zero, tag: e.offset)
            view.image = (e.element as! UIImage)
            _ = view.addGestureTap { (recognizer) in
                if let tap = recognizer as? UITapGestureRecognizer {
                    DDLog(tap.view?.tag as Any)
                }
            }
            self.addSubview(view)
        }
        setNeedsLayout()
        
    }
    
    func block(_ action: @escaping ((BNItemsView, UIControl) -> Void)) -> Void {
        viewBlock = action;
    }
    
    func createImgView(_ rect: CGRect, tag: Int) -> UIImageView {
        let view = UIImageView(frame: rect);
        view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        view.isUserInteractionEnabled = true;
        view.contentMode = .scaleAspectFit;
        view.tag = tag;
        
        return view
    }
    
}
