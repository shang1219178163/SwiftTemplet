//
//	NNUploadImagesView.swift
//	MacTemplet
//
//	Created by shang on 2020/07/19 07:52
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit

import SnapKit
import SwiftExpand
        

@objc protocol NNUploadImagesViewDelegate {
    func didFinishPicker(_ images:[UIImage], isSelectOriginalPhoto: Bool)
}

/// 上传图片九宫格封装
class NNUploadImagesView: UIView {
    
    weak var delegate: NNUploadImagesViewDelegate?

    var maxCount = 9
    ///cell 高度
    var rowHeight: CGFloat = 110

    let imageDefault = UIImage(named: "img_photo_placeholder")!

    var images: [UIImage] = []{
        willSet{
            guard images != newValue else { return }
            itemList = updateButtonItems(newValue.count, type: NNButton.self, hanler: { (sender) in
//                DDLog(self.images.count, newValue.count, sender.tag)
                sender.iconLocation = .rightTop
                sender.iconSize = CGSize(width: 25, height: 25)
                sender.iconBtn.setBackgroundImage(UIImage(named: "icon_delete"), for: .normal)
                
                if newValue.count > sender.tag {
                    let image = newValue[sender.tag]
                    sender.setBackgroundImage(image, for: .normal)
                    sender.setTitle(nil, for: .normal)
                    sender.iconBtn.isHidden = (image == self.imageDefault)
                }
                sender.addActionHandler({ control in
                     guard control is UIButton else { return }
//                     DDLog(sender.tag, sender.backgroundImage(for: .normal), self.imageDefault)
                     
                     if let image = sender.backgroundImage(for: .normal), image == self.imageDefault {
                         self.pickerVC.show()
                     }
                 }, for: .touchUpInside)
                 
                 sender.iconBtn.addActionHandler({ control in
                    guard control is UIButton else { return }
//                     DDLog(sender.tag)
                     if self.images.count > control.tag {
                         self.images.remove(at: control.tag)
                        if self.images.count < self.maxCount && !self.images.contains(self.imageDefault) {
                            self.images.append(self.imageDefault)
                        }
                         self.tableView?.reloadData()
                     }
                 }, for: .touchUpInside)
            })
            setupConstraint()
            let rowCount = itemList.count % numberOfRow == 0 ? itemList.count/numberOfRow : itemList.count/numberOfRow + 1;
            let itemHeight = (rowHeight - inset.top - inset.bottom)/CGFloat(1)
            totalHeight = inset.top + inset.bottom + CGFloat(rowCount - 1)*padding + itemHeight*CGFloat(rowCount)
//            DDLog(rowCount, rowHeight, itemHeight, totalHeight)
        }
    }
    private var itemList: [UIButton] = []

    private(set) var totalHeight: CGFloat = 0{
        willSet{
            var rect = self.frame
            rect.size.height = newValue
            self.frame = rect
        }
    }

    var numberOfRow: Int = 4

    var padding: CGFloat = 10.0
    var inset: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    var showStyle: ShowStyle = .topLeftToRight

    var currrentVC: UIViewController?
    var tableView: UITableView?{
        if let view = currrentVC?.view.subView(UITableView.self) as? UITableView {
            return view
        }
        return nil
    }

    lazy var pickerVC: NNImageAndVideoPickerController = {
        let controller = NNImageAndVideoPickerController()
        controller.maxCount = self.maxCount
        controller.didFinishPickerBlock = { images, assets, isOriginImage in
            var array = [UIImage]()
            array.append(contentsOf: images)
            if array.count < self.maxCount {
                array.append(self.imageDefault)
            }
            self.images = array
            self.tableView?.reloadData()
//            DDLog(self.images.count, self.tableView)
            self.delegate?.didFinishPicker(self.images, isSelectOriginalPhoto: isOriginImage)
        }
        return controller
    }()

    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
    }
    
    func setupConstraint() {
        if itemList.count == 0 || bounds.width <= 10 || bounds.height <= 10{
            return;
        }
        
        let rowCount = itemList.count % numberOfRow == 0 ? itemList.count/numberOfRow : itemList.count/numberOfRow + 1;
        let itemWidth = (bounds.width - CGFloat(numberOfRow - 1)*padding - inset.left - inset.right)/CGFloat(numberOfRow)
        let itemHeight = (bounds.height - CGFloat(rowCount - 1)*padding - inset.top - inset.bottom)/CGFloat(rowCount)
        
        for e in itemList.enumerated() {
            let x = CGFloat(e.offset % numberOfRow) * (itemWidth + padding) + inset.left
            let y = CGFloat(e.offset / numberOfRow) * (itemHeight + padding) + inset.right
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
            e.element.frame = rect;
        }
    }
    // MARK: - funtions

            

}