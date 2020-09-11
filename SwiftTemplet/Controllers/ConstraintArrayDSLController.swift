//
//  ConstraintArrayDSLController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/10.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SnapKitExtend

class ConstraintArrayDSLController: UIViewController {
    
    var titles = ["因此", "每当遇", "到骑手违章", "在执法的同时", "有些交警也会表达体谅",]
        
    var items = [UILabel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        items = view.updateLabelItems(titles.count, type: UILabel.self) { (sender) in
            sender.text = titles[sender.tag]
            sender.backgroundColor = .systemRed
            sender.sizeToFit()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        items.snp.distributeViewsHorizontal(fixedSpacing: 5, leadSpacing: 10, tailSpacing: 10, reversed: false)
    }

}


/////不固定宽度视图平铺
//public func distributeViewsHorizontal(fixedSpacing: CGFloat, leadSpacing: CGFloat, tailSpacing: CGFloat , reversed: Bool) {
//
//    guard self.array.count > 1 else {
//        if array.count == 1 {
//            array[0].snp.makeConstraints { (make) in
//                make.left.equalToSuperview().offset(leadSpacing);
//                make.right.equalToSuperview().offset(-tailSpacing);
//            }
//        }
//        return
//    }
//
//    let list = reversed == false ? array : array.reversed()
//
//    var prev: ConstraintView?
//    for (_, v) in list.enumerated() {
//        v.snp.remakeConstraints { (make) in
//            make.centerY.equalToSuperview()
//
//            if reversed == false {
//                if prev == nil {
//                     make.left.equalToSuperview().offset(leadSpacing)
//                 } else {
//                     make.left.equalTo(prev!.snp.right).offset(fixedSpacing)
//                 }
//            } else {
//                if prev == nil {
//                    make.right.equalToSuperview().offset(-tailSpacing)
//                } else {
//                    make.right.equalTo(prev!.snp.left).offset(-fixedSpacing)
//                }
//            }
//        }
//        prev = v
//    }
//}
