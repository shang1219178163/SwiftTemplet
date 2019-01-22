//
//  CustomViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/19.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand

class CustomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var list:[String] = []
        for i in 0...16 {
            list.append("\(i)")
        }
        
        itemView.frame = CGRect(x: 20, y: 20, width: kScreenWidth - 40.0, height: kScreenWidth - 40.0)
        itemView.items = list
        view.addSubview(itemView)
        
        
        var listNew:[String] = []
        for i in 0...12 {
            listNew.append("\(i)")
        }
        itemView.items = listNew
        
        view.getViewLayer()
    }
    

    
    lazy var itemView: BNItemsView = {
        var view = BNItemsView(frame: .zero)
        view.block({ (itemsView, sender) in
            if let btn = sender as? UIButton {
                print(btn.titleLabel?.text)

            }
        })
        return view;
    }()
}
